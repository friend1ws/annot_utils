FROM ubuntu:16.04
MAINTAINER Yuichi Shiraishi <friend1ws@gmail.com> 

RUN apt-get update && apt-get install -y \
    git \
    wget \
    bzip2 \
    make \
    gcc \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    python \
    python-pip

RUN wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar jxvf htslib-1.9.tar.bz2 && \
    cd htslib-1.9 && \
    make && \
    make install

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

RUN wget https://github.com/friend1ws/annot_utils/archive/v0.3.0.tar.gz && \
    tar xzvf v0.3.0.tar.gz && \
    cd annot_utils-0.3.0/resource && \
    bash prep_data.sh && \
    cd .. && \
    python setup.py build install
