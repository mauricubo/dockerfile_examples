FROM ubuntu:latest

ENV TZ "UTC"

# Install openssh and sudo
RUN apt-get update && \
	apt-get install -y openssh-server && \
	apt-get -y install sudo

# Install ansible
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt update && \
    apt -y upgrade && \
    apt install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt update && \
    apt install -y ansible

# Create user and add privileges
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu \
	-p "$(openssl passwd -6 ubuntu)"

EXPOSE 22
# Check if password was setted on run
ENTRYPOINT if [ -n "$SSH_PASS" ]; then `echo ubuntu:$SSH_PASS | chpasswd`; fi && \
		service ssh start -D
