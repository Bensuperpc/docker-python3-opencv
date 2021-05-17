FROM python:3.9

LABEL author="Josip Janzic <josip@jjanzic.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"
LABEL version="1.0.0"

WORKDIR /opt/build

ARG OPENCV_VERSION="4.5.2"
ENV OPENCV_VERSION=$OPENCV_VERSION

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential \
        ninja-build \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libopenjp2-7-dev \
        libavformat-dev \
        libpq-dev \
    && pip install numpy \
    && wget -q https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv.zip \
    && unzip -qq opencv.zip -d /opt \
    && rm -rf opencv.zip \
    && cmake \
        -G Ninja \
        -D BUILD_TIFF=ON \
        -D BUILD_opencv_java=OFF \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D WITH_CUDA=OFF \
        -D WITH_OPENGL=ON \
        -D WITH_OPENCL=ON \
        -D WITH_IPP=ON \
        -D WITH_TBB=ON \
        -D WITH_EIGEN=ON \
        -D WITH_V4L=ON \
        -D BUILD_TESTS=ON \
        -D BUILD_PERF_TESTS=OFF \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=$(python3.9 -c "import sys; print(sys.prefix)") \
        -D PYTHON_EXECUTABLE=$(which python3.9) \
        -D PYTHON_INCLUDE_DIR=$(python3.9 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -D PYTHON_PACKAGES_PATH=$(python3.9 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
        /opt/opencv-${OPENCV_VERSION} \
    && ninja \
    && ninja install \
    && rm -rf /opt/build/* \
    && rm -rf /opt/opencv-${OPENCV_VERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qq autoremove \
    && apt-get -qq clean
