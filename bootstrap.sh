#!/bin/bash

parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary ext4 0% 100%
udevadm settle

pvcreate /dev/sdb1
vgcreate cinder-volumes /dev/sdb1
lvcreate -l 100%FREE -n cinder-volumes-lv cinder-volumes

growpart /dev/sda 3
pvresize /dev/sda3
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv -r