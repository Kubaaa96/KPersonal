FROM gcc:12.2.0

RUN apt-get update && apt-get -y install sudo software-properties-common ninja-build

RUN cd /tmp &&  \
    wget https://github.com/Kitware/CMake/archive/refs/tags/v3.26.1.tar.gz &&  \
    tar -zxvf v3.26.1.tar.gz

RUN unlink /usr/lib/x86_64-linux-gnu/libstdc++.so.6 &&  \
    cp /usr/local/lib64/libstdc++.so.6.0.30 /usr/lib/x86_64-linux-gnu/ &&  \
    ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.30 /usr/lib/x86_64-linux-gnu/libstdc++.so.6

RUN cd /tmp/CMake-3.26.1 &&  \
    ./bootstrap &&  \
    sudo gmake &&  \
    sudo gmake install

RUN apt-get -qq update; \
    apt-get install -qqy --no-install-recommends \
        gnupg2 wget ca-certificates apt-transport-https \
        autoconf automake cmake dpkg-dev file make patch libc6-dev

RUN wget -nv -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-15 main" \
        > /etc/apt/sources.list.d/llvm.list; \
    apt-get -qq update && \
    apt-get install -qqy -t llvm-toolchain-focal-15 clang-15 clang-tidy-15 clang-format-15 lld-15 && \
    for f in /usr/lib/llvm-15/bin/*; do ln -sf "$f" /usr/bin; done && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp &&  \
    wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz &&  \
    tar -xf Python-3.11.*.tgz &&  \
    cd Python-3.11.*/ &&  \
    ./configure --enable-optimizations &&  \
    make -j $(nproc) &&  \
    sudo make altinstall

RUN unlink /usr/bin/python3 &&  \
    ln -s /usr/local/bin/python3.11 /usr/bin/python3 &&  \
    ln -s /usr/local/bin/python3.11 /usr/bin/python && \
    ln -s /usr/local/bin/pip3.11 /usr/bin/pip3 && \
    ln -s /usr/local/bin/pip3.11 /usr/bin/pip

RUN pip install conan==1.59.0