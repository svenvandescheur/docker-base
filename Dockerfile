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

# Add file tree
ADD files /

# Set entrypoint file
ENTRYPOINT ["/entrypoint.sh"]

