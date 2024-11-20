#!/bin/bash

#https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/managing_file_systems/partition-operations-with-parted_managing-file-systems#viewing-the-partition-table-with-parted_partition-operations-with-parted
#parted /dev/sda1 print
#parted /dev/sdb mklabel msdos mkpart primary cinder ext4 1 40GB

arted: invalid token: msdos
Partition type?  primary/extended? ^C
Error: Expecting a partition type.
(parted) mkpart primary msdos cinder ext4 0 40GB
parted: invalid token: msdos
File system type?  [ext2]? ^C
Error: Expecting a file system type.
(parted) mkpart
Partition type?  primary/extended? primary
File system type?  [ext2]? ext4
Start? 0
End? 40GB
Warning: The resulting partition is not properly aligned for best performance: 1s % 2048s != 0s
Ignore/Cancel? Ca
(parted) mkpart
Partition type?  primary/extended? primary
File system type?  [ext2]? ext4
Start? 1
End? 42.9GB
(parted) print
Model: Msft Virtual Disk (scsi)
Disk /dev/sdb: 42.9GB
Sector size (logical/physical): 512B/4096B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  42.9GB  42.9GB  primary  ext4         lba


 pvcreate /dev/sdb1
 vgcreate cinder-volumes /dev/sdb1