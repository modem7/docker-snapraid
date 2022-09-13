FROM debian:11.5

LABEL maintainer="Modem7"
LABEL description="This container will allow you to build a Snapraid .deb file without installing any build dependencies on your system."

ARG SNAPRAID_VERSION

# Builds SnapRAID from source
RUN apt-get update && \
    apt-get install -y \
      gcc \
      git \
      make \
      checkinstall \
      curl \
      libblkid1
RUN curl -LO https://github.com/amadvance/snapraid/releases/download/v${SNAPRAID_VERSION}/snapraid-${SNAPRAID_VERSION}.tar.gz && \
      tar -xvf snapraid-${SNAPRAID_VERSION}.tar.gz && \
      cd snapraid-${SNAPRAID_VERSION} && \
      ./configure && \
      make -j4 && \
      make -j4 check && \
      checkinstall -Dy --install=no --nodoc && \
      mkdir /build && \
      cp *.deb /build/snapraid-from-source.deb
