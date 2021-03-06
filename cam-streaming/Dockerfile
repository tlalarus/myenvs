FROM ubuntu:bionic

# change apt server & update
RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/extras.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN apt-get update

# install essential package
ARG OPENCV_VERSION="3.4.6"
ARG INSTALL_PATH="/usr/local"
ARG CONCURRENCY=4
RUN apt install -y build-essential cmake curl \
    libavformat-dev libavcodec-dev libswscale-dev libv4l-dev libjpeg-dev libpng-dev pkg-config
RUN curl -sL https://github.com/Itseez/opencv/archive/${OPENCV_VERSION}.tar.gz | tar xvz -C /tmp

WORKDIR /tmp/opencv-${OPENCV_VERSION}
RUN cmake -H. -BRelease \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_SHARED_LIBS=OFF \ 
    -DBUILD_TESTS=OFF \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DFORCE_VTK=OFF \
    -DWITH_FFMPEG=OFF \
    -DWITH_GDAL=OFF \ 
    -DWITH_IPP=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_OPENGL=OFF \ 
    -DWITH_QT=OFF \
    -DWITH_TBB=OFF \ 
    -DWITH_XINE=OFF \ 
    -DWITH_TIFF=OFF \
    -DWITH_CUDA=OFF \
    -DBUILD_JPEG=ON  \
    -DBUILD_TIFF=ON \
    -DBUILD_PNG=ON
WORKDIR /tmp/opencv-${OPENCV_VERSION}/Release
RUN make -j${CONCURRENCY} && make install

# config
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
RUN ldconfig

# cleanup package manager
#RUN apt-get remove --purge -y curl build-essential cmake
#RUN apt-get autoclean && apt-get clean
#RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN apt-get install wget
RUN wget https://www.ximea.com/downloads/recent/XIMEA_Linux_SP.tgz -O /opt/XIMEA_Linux_SP.tgz
RUN tar xzf XIMEA_Linux_SP.tgz &&\
  apt-get update &&\
  apt install sudo &&\
  ./package/install

  


