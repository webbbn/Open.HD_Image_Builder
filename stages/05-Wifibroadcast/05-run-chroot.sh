# On chroot

# Install dependencies
apt install python3-pyudev libpcap0.8 libboost-all-dev cython3 libv4l-dev

# Work in a temporary directory
mkdir tmp_build
(
    cd tmp_build

    # Download the zip files and install the debs
    for DL in \
	https://github.com/webbbn/wifibroadcast_bridge/suites/337767644/artifacts/515513 \
	    https://github.com/webbbn/wifibroadcast_bridge/suites/337767644/artifacts/515513 \
	; do
	wget -O debs.zip "${DL}"
	unzip debs.zip
	dpkg -i */*.deb
	rm -rf *
    done
)
rm -rf tmp_build
