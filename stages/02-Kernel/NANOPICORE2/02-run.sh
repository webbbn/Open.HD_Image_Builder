set -e

# Do this to the WORK folder of this stage
pushd ${STAGE_WORK_DIR}

log "Compile kernel For NanoPi H5 hardware"
pushd linux

log "Copy Kernel config"
cp "${STAGE_DIR}/FILES/nanopi-neo2-4.14.52-wifibroadcast.config" ./.config

touch .scmversion
make sunxi_arm64_defconfig ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
make Image dtbs ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

MNT_DIR="${STAGE_WORK_DIR}/mnt"

log "Copy kernel image and dtb's to sd-image"
cp arch/arm64/boot/Image "${MNT_DIR}/boot/"
cp arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi*.dtb "${MNT_DIR}/boot/"

log "Build modules"
make modules ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
make modules_install INSTALL_MOD_PATH="${MNT_DIR}/rootfs/" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

# out of linux 
popd

#return 
popd
