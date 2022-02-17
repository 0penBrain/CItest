FROM ubuntu:20.04
MAINTAINER openBrain
# This is a docker image aiming at fast FreeCAD compilation by use of Ninja and Clang
# It also provides CCache and GCC so it can be used instead.

ENV DEBIAN_FRONTEND=noninteractive

# Add FreeCAD PPA repo for up-to-date dependencies
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository ppa:freecad-maintainers/freecad-daily \
    && apt-get update -y --fix-missing

# Add FreeCAD build & run dependencies + Clang + Ninja
RUN apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    cmake \
    git \
    graphviz \
    libboost-date-time-dev \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-iostreams-dev \
    libboost-program-options-dev \
    libboost-python-dev \
    libboost-regex-dev \
    libboost-serialization-dev \
    libboost-thread-dev \
    libcoin-dev \
    libeigen3-dev \
    libgts-bin \
    libgts-dev \
    libkdtree++-dev \
    libmedc-dev \
    libocct-data-exchange-dev \
    libocct-ocaf-dev \
    libocct-visualization-dev \
    libopencv-dev \
    libproj-dev \
    libpyside2-dev \
    libqt5opengl5-dev \
    libqt5svg5-dev \
    libqt5webkit5-dev \
    libqt5x11extras5-dev \
    libqt5xmlpatterns5-dev \
    libshiboken2-dev \
    libspnav-dev \
    libvtk7-dev \
    libx11-dev \
    libxerces-c-dev \
    libzipios++-dev \
    ninja-build \
    occt-draw \
    pybind11-dev \
    pyqt5-dev-tools \
    pyside2-tools \
    python3-dev \
    python3-matplotlib \
    python3-pivy \
    python3-ply \
    python3-yaml \
    python3-pyside2.qtcore \
    python3-pyside2.qtgui \
    python3-pyside2.qtsvg \
    python3-pyside2.qtwidgets \
    python3-pyside2.qtnetwork \
    python3-pyside2.qtwebengine \
    python3-pyside2.qtwebenginecore \
    python3-pyside2.qtwebenginewidgets \
    python3-pyside2.qtwebchannel \
    python3-markdown \
    python3-git \
    qtbase5-dev \
    qttools5-dev \
    swig \
    xvfb \
    && apt-get install -y --no-install-recommends ccache \
    && apt-get update -y --fix-missing \
    && apt-get clean \
    && rm /var/lib/apt/lists/* \
          /usr/share/doc/* \
          /usr/share/locale/* \
          /usr/share/man/* \
          /usr/share/info/* -fR
