*Based on https://github.com/sba1/qt-win-docker*

This is debian-jessie image. It uses [MXE](https://github.com/mxe/mxe) (M Cross Environment) and Qt 5.6 (static) for cross compiling qt-applications.

### Hot to run?

1. Pull image:

```
docker pull approximatenumber/qt-win-docker:5.6
```
or clone repo and build local image:

```
git clone <this-repo>
cd qt-win-docker/
docker build -t qt-win-docker:5.6 ./
```

2. Build your Qt-project:

```
cd <project-dir>
docker run -it --rm ${PWD}:/src qt-win-docker:5.6 /bin/bash
cd /src
qmake -makefile
make
exit
```
