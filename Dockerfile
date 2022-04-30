FROM ubuntu:16.04

ARG git_username
ARG git_email
ARG DEBIAN_FRONTEND=noninteractive

# Install all packages .................................................................................................

RUN apt-get update 

RUN apt-get install -y \
    sudo \
    curl

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

RUN apt-get install -y \
    openssh-server \
    gcc \
    g++ \
    make \
    cmake \
    nasm \
    gdb \
    git \
    vim \
    nodejs

# SSH configuration ....................................................................................................

COPY ssh /root/.ssh
RUN chmod -R 600 /root/.ssh

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# VIM configuration ....................................................................................................

RUN git clone https://github.com/KnifeOnlyI/VIM-Configuration.git /root/.vim
RUN git clone https://github.com/tpope/vim-pathogen.git /root/.vim/pathogen

WORKDIR /root/.vim/pathogen
RUN git pull

WORKDIR /root/.vim/bundle
RUN git clone https://github.com/jiangmiao/auto-pairs

# GIT configuration ....................................................................................................

RUN git config --global push.default matching
RUN git config --global user.name "${git_username}"
RUN git config --global user.email "${git_email}"

# Python configuration .................................................................................................

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Create project directories ...........................................................................................

WORKDIR /root

RUN mkdir asm
RUN mkdir c
RUN mkdir cpp
RUN mkdir python
RUN mkdir nodejs

# Start SSH server at docker starting ..................................................................................

CMD ["/usr/sbin/sshd", "-D"]