From ubuntu:16.04
MAINTAINER Yuichi Shiraishi <friend1ws@gmail.com> 

RUN apt-get update && apt-get install -y \
    git \
    wget \
    bzip2 \
    make \
    gcc \
    zlib1g-dev \
    python \
    python-pip

RUN wget https://github.com/samtools/htslib/releases/download/1.3.2/htslib-1.3.2.tar.bz2 && \
    tar jxvf htslib-1.3.2.tar.bz2 && \
    cd htslib-1.3.2 && \
    make && \
    make install

RUN pip install --upgrade setuptools

RUN git clone http://github.com/friend1ws/annot_utils.git && \
    cd annot_utils/resource && \
    bash prep_data.sh && \
    cd ../ && \
    python setup.py build install

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/annot_utils"] 
CMD ["--help"]
