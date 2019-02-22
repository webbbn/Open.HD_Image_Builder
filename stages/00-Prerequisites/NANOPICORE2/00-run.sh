log "Checking prerequisites"

pushd "${STAGE_WORK_DIR}"

if [ ! -d ~/nanopitools ]; then
    log "Download NanoPi Tools from Google Drive"
    ../../scripts/gdown.pl https://drive.google.com/open?id=1MZ4gXAISbSPtfhUQJyUEVRvrE56jBYQ2 ./gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz

    log "Extract NanoPi Tools"
    mkdir -p ~/nanopitools
    tar xf "gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz" -C ~/nanopitools

    log "Install the NanoPi Tools"
    echo "PATH=\$PATH:~/nanopitools/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu/bin" >> ~/.bashrc
    source ~/.bashrc
fi

popd

