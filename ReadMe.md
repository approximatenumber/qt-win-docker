*Based on https://github.com/sba1/qt-win-docker*

**Use `qt5.6` branch for Qt 5.6 LTS!**

It uses [MXE](https://github.com/mxe/mxe) (M Cross Environment) and Qt latest (static) for cross compiling qt-applications.

### Hot to run?

1. Pull image:

```
docker pull approximatenumber/qt-win-docker
```
or clone repo and build local image:

```
git clone <this-repo>
cd qt-win-docker/
docker build -t qt-win-docker ./
```

2. Build your Qt-project:

```
cd <project-dir>
docker run -it --rm ${PWD}:/src qt-win-docker /bin/bash
cd /src
qmake -makefile
make
exit
```
