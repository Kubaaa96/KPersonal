FROM gcc_12_2_clang_15_cmake_3_25_2_python_3_11:0.1.0

RUN apt-get update && \
    apt-get install -y ssh rsync gdb nano

RUN rm -rf /var/lib/apt/lists/*

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

RUN echo "root:password" | chpasswd
ENV PS1="\$ "
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]

