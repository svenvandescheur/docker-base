FROM ubuntu:16.04
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Initialize noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

# Explicitly set user/group IDs
# Install required packages
RUN groupadd -r app --gid=999 && useradd -r -g app --uid=999 app && \
    chown -R app:app /srv/ && \

    apt-get update && apt-get install -y \
    cron \
    git \
    inetutils-ping \
    libjpeg-dev \
    mailutils \
    net-tools \
    npm \
    nodejs-legacy \
    postfix \
    psmisc \
    python-pip \
    rsyslog \
    telnet-ssl \
    vim \
    wget && \

    pip install --upgrade pip

# Compile tarsnap
RUN apt-get install -y gcc libc6-dev make libssl-dev zlib1g-dev e2fslibs-dev && \
    wget https://www.tarsnap.com/download/tarsnap-autoconf-1.0.37.tgz && \
    tar -xzf tarsnap-autoconf-1.0.37.tgz && \
    cd tarsnap-autoconf-1.0.37/ && \
    ./configure && \
    make && \
    make install

# Add file tree
ADD files /

# Set entrypoint file
ENTRYPOINT ["/entrypoint.sh"]

