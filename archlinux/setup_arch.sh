#!/bin/sh -x

HOSTNAME=$1
HDD=$2
PARTITIONING=$3

# fix below check
test -z $HOSTNAME && echo "HOSTNAME as arg1 is required" && exit 2

echo HOSTNAME=$HOSTNAME
EFI=0

if [ -f /sys/firmware/efi/efivars ]; then
    EFI=1
fi

ping -c 1 archlinux.org > /dev/null 2>&1
res=$?
if [ $res -ne 0 ]; then
    echo "No internet access! Exit setup ($res)."
    exit $res
fi

timedatectl set-ntp true
res=$?
if [ $res -ne 0 ]; then
    echo "timedatectl failed! Exit setup ($res)."
    exit $res
fi

if [ -z $PARTITIONING ]; then
    echo "Time to partition the disks"
    if [ $EFI -eq 1 ]; then
        echo "Your boot partition must be UEFI type"
    fi
    echo "use a tool such as fdisk to partition the disk"
    echo "When done also run mkfs.<fstype> and create a file system on needed partitions"
    echo "Also mount all partitions into /mnt. See below example:"
    echo "mount /dev/sda1 /mnt"
    echo "mkdir /mnt/boot"
    echo "mount /dev/sda2 /mnt/boot"
    echo "mount /dev/sda3 /mnt/..."
    echo "..."
    echo "When done with the partions and fs creation and mounting, re-run the script with "1" as arg: './setup_arch 1'"
    exit 6
fi

pacstrap /mnt {base,base-devel}
genfstab -U /mnt >> /mnt/etc/fstab
echo $HOSTNAME > /mnt/etc/hostname
echo "127.0.1.1 $HOSTNAME.localdomain  $HOSTNAME" >> /mnt/etc/hosts
echo $HDD > /mnt/hdd.txt
arch-chroot /mnt /bin/bash -c "ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime ; \
    hwclock --systohc ; \
    locale-gen ; \
    echo 'LANG=en_US.UTF-8' >> /etc/locale.conf ; \
    echo 'Set root pwd'
    echo 'root:changeme' | chpasswd ; \
    pacman -Sy grub ; \
    grub-install --target=i386-pc /dev/sda ; \
    grub-mkconfig -o /boot/grub/grub.cfg"
umount -R /mnt
echo "REBOOT SYSTEM"
# reboot
