FROM debian:buster-slim

RUN echo "now buiilding..."

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget xz-utils ffmpeg git curl -y
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
RUN tar Jxfv Python-3.9.16.tar.xz
RUN rm Python-3.9.16.tar.xz
RUN apt-get install build-essential libbz2-dev libdb-dev libreadline-dev libffi-dev libgdbm-dev liblzma-dev libncursesw5-dev libsqlite3-dev libssl-dev zlib1g-dev uuid-dev tk-dev -y
RUN cd Python-3.9.16/ && ./configure && make && make install
RUN pip3 install git+https://github.com/openai/whisper.git 
# Rust install
ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
RUN mkdir /usr/local/lib/rust && \
    chmod 0755 $RUST_HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh \
    && chmod +x ${RUST_HOME}/rustup.sh \
    && ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path
ENV PATH $PATH:$CARGO_HOME/bin

RUN apt-get remove build-essential libbz2-dev libdb-dev libreadline-dev libffi-dev libgdbm-dev liblzma-dev libncursesw5-dev libsqlite3-dev libssl-dev zlib1g-dev uuid-dev tk-dev wget xz-utils git curl -y
