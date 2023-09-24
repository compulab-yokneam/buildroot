#!/bin/sh

BOARD_DIR="$(dirname $0)"

UUID=$(dumpe2fs ${BINARIES_DIR}/rootfs.ext2  2>/dev/null | awk '(/Filesystem UUID:/)&&($0=$NF)')
cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
sed -i "s/UUID_TMP/$UUID/g" ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
