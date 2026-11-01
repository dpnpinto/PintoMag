#!/bin/bash
# Instalação do Arch Linux 32-bit (archlinux32) em BIOS (MBR) com dwm + st
# ATENÇÃO: Este script serve como referência e usa /dev/sda como base.

echo "=== 0. Iniciar ==="
set -e # Terminar em caso de erro

echo "=== 1. Preparando discos (MBR/BIOS) ==="
# /dev/sda1: Linux swap (4GB)
# /dev/sda2: Linux filesystem (Restante, Bootable)

# Limpar tabela de partições e criar MBR com sfdisk
sfdisk /dev/sda <<EOF
label: dos
device: /dev/sda
unit: sectors

/dev/sda1 : size=8388608, type=82
/dev/sda2 : size=+, type=83, bootable
EOF

# Formatação das partições
mkswap /dev/sda1
mkfs.ext4 -F /dev/sda2

echo "=== 2. Montando partições ==="
mount /dev/sda2 /mnt
swapon /dev/sda1

echo "=== 3. Sincronizando relógio ==="
timedatectl set-ntp true

echo "=== 4. Instalando sistema base (Arch32 + pacstrap) ==="
# Instala pacotes base do Arch Linux 32
pacstrap -K /mnt base base-devel linux linux-firmware grub dhcpcd vim htop fastfetch xorg-server xorg-xinit dwm st

echo "=== 5. Gerar fstab ==="
genfstab -U /mnt >> /mnt/etc/fstab

echo "=== 6. Criando script de instalação em modo chroot ==="
cat << 'EOF' > /mnt/chroot_install.sh
#!/bin/bash
set -e

echo "=== 7. Configurando Fuso Horário e Relógio ==="
ln -sf /usr/share/zoneinfo/Atlantic/Azores /etc/localtime
hwclock --systohc

echo "=== 8. Configurando Localidade ==="
sed -i 's/#pt_PT.UTF-8 UTF-8/pt_PT.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=pt_PT.UTF-8" > /etc/locale.conf

echo "=== 9. Hostname e Rede ==="
echo "Magalhaes32" > /etc/hostname
cat << 'HOSTS' > /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   Magalhaes32.localdomain Magalhaes32
HOSTS

# Ativar serviço de rede (dhcpcd)
systemctl enable dhcpcd

echo "=== 10. Configuração GRUB (Bootloader BIOS / i386-pc) ==="
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "=== 11. Utilizadores e Privilégios ==="
echo "root:magalhaes" | chpasswd

# Criar utilizador comum
useradd -m -G wheel,audio,video,storage -s /bin/bash magalhaes
echo "magalhaes:magalhaes" | chpasswd

# Configurar sudo para o grupo wheel
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel

echo "=== 12. Configuração do ambiente Gráfico (dwm + st) ==="
# Configurar .xinitrc para iniciar o dwm automaticamente com startx
cat << 'XINIT' > /home/magalhaes/.xinitrc
#!/bin/sh
# Executar dwm
exec dwm
XINIT

chown magalhaes:magalhaes /home/magalhaes/.xinitrc
chmod +x /home/magalhaes/.xinitrc

echo "=== Instalação Base concluída com sucesso! ==="
EOF

chmod +x /mnt/chroot_install.sh

echo "A executar o chroot..."
arch-chroot /mnt /chroot_install.sh

rm /mnt/chroot_install.sh

echo "Concluído! Pode desmontar e reiniciar:"
echo "umount -R /mnt && reboot"
