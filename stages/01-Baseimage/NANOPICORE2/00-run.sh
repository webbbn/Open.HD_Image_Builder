# Do this to the WORK folder of this stage
pushd ${STAGE_WORK_DIR}

log "Clear any previous images"
rm -f *.img
rm -f *.zip

log "Download NanoPi debian base Image"
../../scripts/gdown.pl https://drive.google.com/open?id=1O9JPd6wT1ICDutdq1Dk8140HdkUZv8Yf ./nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img.zip

#if [ ! -f "${STAGE_DIR}/nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img.zip" ]; then
#  log "Visit https://drive.google.com/drive/folders/1moc57opcmlMle66bOCXgxA6OcoV7qrGh"
#  log "Download latest nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img.zip"
#  exit 1
#fi

#cp "${STAGE_DIR}/nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img.zip" "${STAGE_WORK_DIR}"
unzip "nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img.zip" 

log "Rename to IMAGE.img"
mv "nanopi-neo-core2_sd_friendlycore-xenial_4.14_arm64_20181011.img" "IMAGE.img"

# return
popd


