# modem7/docker-snapraid

[![CI](https://github.com/modem7/docker-snapraid/actions/workflows/ci.yml/badge.svg)](https://github.com/modem7/docker-snapraid/actions/workflows/ci.yml)
[![Release](https://github.com/modem7/docker-snapraid/actions/workflows/release.yml/badge.svg)](https://github.com/modem7/docker-snapraid/actions/workflows/release.yml)

This container will allow you to build a Snapraid `.deb` file without installing any build dependencies on your system.

Built from source: https://github.com/amadvance/snapraid/

### Usage

```sh
./build.sh [<version>] # e.g. ./build.sh 12.0
sudo dpkg -i snapraid*.deb
```

If the version is omitted, the default version is used.

The build script spins up a container, executes the `Dockerfile` which performs the actual build from source. The script then copies the built `.deb` artifact out onto your local system ready for installation using `dpkg`.

To save building it yourself, you can also download the `.deb` file as an artifact from GitHub actions.

### Installation instructions

Ensure to update version number!
```
wget https://github.com/modem7/docker-snapraid/releases/download/12.0/snapraid-from-source.deb
sudo dpkg -i snapraid-from-source.deb
```

If the version is out of date, please submit a Pull Request or open an issue.

Forked from [IronicBadger/docker-snapraid](https://github.com/ironicbadger/docker-snapraid)
