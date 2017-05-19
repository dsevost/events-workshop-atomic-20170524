#!/bin/bash

#set -x

LIBVIRT_IMAGES_ROOT=/volumes/btrfs/system/dsevosty-mbp/libvirt-images

vm=${1:-atomic01}-base
disk=${2:-$LIBVIRT_IMAGES_ROOT/rhel-atomic-cloud-7.3.4-11.x86_64.qcow2}

disk_ext=qcow2

vm_disk=$LIBVIRT_IMAGES_ROOT/workshop-atomic/${vm}.$disk_ext

if [ -z "$vm" -o -z "$disk" ] ; then 
    echo "Syntax: $0 <vm_name>-base <parent_disk>"
    exit 1
fi

if [ -e "${vm_disk}" ] ; then
    echo "Disk ${vm_disk} already exists"
    exit 1
fi

[ -d $LIBVIRT_IMAGES_ROOT/workshop-atomic ] || \
    sudo \
    mkdir -p $LIBVIRT_IMAGES_ROOT/workshop-atomic

sudo \
cp --reflink $disk ${vm_disk}
sudo \
qemu-img resize ${vm_disk} 32G
sudo \
cp -f $(pwd)/cloud-init/cloud-init.iso $LIBVIRT_IMAGES_ROOT/workshop-atomic
sudo \
restorecon -R $LIBVIRT_IMAGES_ROOT/workshop-atomic

sudo \
virt-install -v \
    --name $vm \
    --virt-type kvm \
    --ram 4096 \
    --vcpus 2 \
    --os-type linux \
    --os-variant rhel7 \
    --controller type=scsi,model=virtio-scsi \
    --disk path=${vm_disk},bus=scsi,cache=none \
    --disk path=$LIBVIRT_IMAGES_ROOT/workshop-atomic/cloud-init.iso,device=cdrom,bus=scsi \
    --nographics \
    --console pty,target_type=serial \
    -w network=default,model=virtio \
    --boot hd
