# FROM ubuntu:24.04 
FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone


# update pakages
# RUN apt-get update && \
#     apt-get install -y software-properties-common && \
#     add-apt-repository universe && \
#     apt-get update && apt-get upgrade -y && \
#     apt-get install -y \
#     wget \
#     xz-utils \
#     git \
#     curl \
#     zsh \
#     sudo \
#     lua5.1 \
#     make \
#     gettext \
#     build-essential \
#     libbz2-dev \
#     libdb-dev \
#     libreadline-dev \
#     libffi-dev \
#     libgdbm-dev \
#     liblzma-dev \
#     libncursesw5-dev \
#     libsqlite3-dev \
#     libssl-dev \
#     zlib1g-dev \
#     uuid-dev \
#     tk-dev \
#     libeigen3-dev && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get upgrade -y \
    && apt-get install  -y \
    wget \
    xz-utils \
    git \
    curl \ 
    zsh \
    sudo \
    lua5.1 \
    luarocks \
    make \
    gettext \
    build-essential \
    libbz2-dev \
    libdb-dev \ 
    libreadline-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \ 
    libncursesw5-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev \
    uuid-dev \
    tk-dev \
    libeigen3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# luarocks をソースからインストール
# RUN curl -R -O http://www.luarocks.org/releases/luarocks-3.9.2.tar.gz && \
#     tar zxpf luarocks-3.9.2.tar.gz && \
#     cd luarocks-3.9.2 && \
#     ./configure && make && make install && \
#     cd .. && rm -rf luarocks-3.9.2 luarocks-3.9.2.tar.gz

 
# install cmake 
RUN wget https://github.com/Kitware/CMake/releases/download/v3.29.6/cmake-3.29.6-linux-x86_64.sh \
    && chmod +x cmake-3.29.6-linux-x86_64.sh \
    && ./cmake-3.29.6-linux-x86_64.sh --skip-license --prefix=/usr/local

# install neovim
RUN git clone --branch stable --depth 1 https://github.com/neovim/neovim \
      && cd neovim \ 
      && make CMAKE_BUILD_TYPE=RelWithDebInfo \
      && make install \
      && cd ..\
      && rm -r neovim

# install python
RUN wget https://www.python.org/ftp/python/3.8.20/Python-3.8.20.tar.xz
RUN tar Jxfv Python-3.8.20.tar.xz
RUN rm Python-3.8.20.tar.xz
RUN cd Python-3.8.20/ && ./configure && make && make install

# pipを使ってpoetryをインストール
RUN pip3 install poetry

RUN curl -L https://raw.githubusercontent.com/libapps/libapps-mirror/main/hterm/etc/osc52.sh -o osc52.sh \
    && chmod +x osc52.sh \
    && mv osc52.sh /usr/local/bin/clip

# set zsh
ENV SHELL=/usr/bin/zsh 
RUN zsh
RUN chsh -s /usr/bin/zsh 

# create nolmal docker
RUN useradd -ms /bin/bash docker
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /home/docker

# install node
RUN curl -L git.io/nodebrew | perl - setup
ENV PATH=~/.nodebrew/current/bin:$PATH
RUN ~/.nodebrew/current/bin/nodebrew install-binary 16.20.2 \
    && ~/.nodebrew/current/bin/nodebrew use v16.20.2

ENV PATH=/home/docker/.nodebrew/current/bin:$PATH


ENV ZPLUG_HOME=/home/docker/.zplug
# zplugのインストール
RUN git clone --depth 1 https://github.com/zplug/zplug.git /home/docker/.zplug \
    && echo "source /home/docker/.zplug/init.zsh" >> /home/docker/.zshrc

 
# install my env
RUN git clone  -b docker https://github.com/ankurugranpa/dotfiles.git \
     && bash /home/docker/dotfiles/.installer/install.sh 
RUN nvim --headless "+Lazy! sync" +qa
# RUN nvim --headless -c "MasonInstall pyright, clangd, cmake-language-server" +qa
RUN nvim --headless -c "MasonInstall clangd" +qa
RUN nvim --headless -c "MasonInstall pyright" +qa
RUN nvim --headless -c "MasonInstall cmake-language-server" +qa

CMD ["zsh"]
