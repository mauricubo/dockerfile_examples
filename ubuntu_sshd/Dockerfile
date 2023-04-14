FROM ubuntu:latest

# Install openssh and sudo
RUN apt-get update && \
	apt-get install -y openssh-server && \
	apt-get -y install sudo

# Create user and add privileges 
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu \
	-p "$(openssl passwd -6 ubuntu)"

EXPOSE 22
# Check if password was setted on run
ENTRYPOINT if [ -n "$SSH_PASS" ]; then `echo ubuntu:$SSH_PASS | chpasswd`; fi && \ 
		service ssh start -D
