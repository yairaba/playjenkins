FROM ubuntu:20.04 AS tkd-base
# avoid stuck build due to user prompt
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update  && \ 
	apt-get install -y apt-utils  2>&1 | grep -v "debconf: delaying package configuration, since apt-utils is not installed"  && \
	apt-get install --no-install-recommends -y locales sudo wget gnupg2 ca-certificates curl unzip && \
	apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	sed -i 's/# he_IL.UTF-8 UTF-8/he_IL.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure locales && \	
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV TAKADU_USER=takadu
RUN useradd --create-home "${TAKADU_USER}"
RUN adduser "${TAKADU_USER}" sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY tkdbashrc /home/takadu
RUN echo  source /home/takadu/tkdbashrc  >> /home/takadu/.bashrc 


#create takadu dirs
RUN sudo mkdir /etc/$TAKADU_USER && \
	#sudo mkdir -p /mnt/tkd1/takadu/production && \
	sudo mkdir -p /mnt/tkd3/takadu/apache && \
	sudo mkdir -p /mnt/tkd3/takadu/logs/apache && \
	sudo chown -R $TAKADU_USER:$TAKADU_USER  /mnt/* && \
    sudo chown -R $TAKADU_USER:$TAKADU_USER  /etc/$TAKADU_USER