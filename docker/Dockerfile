FROM i386/debian:stretch

# Install build dependencies
RUN apt-get update && apt-get install -y \
  bc \
  bison \
  build-essential \
  curl \
  flex \
  cpio \
  wget \
  unzip \
  git-core \
  parted \
  sudo \
  libcap2-bin \
  kmod \
  qemu-user-static \
  dosfstools

# Create working directory
RUN mkdir -p /workdir
WORKDIR /workdir

# Run the kernel builder from the current directory
CMD ["./build.sh"]
