diskutil erasedisk HFS+ Untitled /dev/disk4
diskutil info /dev/disk4 >> diskinfo.txt   
diskutil info /dev/disk4s2 >> diskinfo.txt
lpr diskinfo.txt
diskutil eject /dev/disk4
Rm diskinfo.txt
