# Use the official image as a parent image
FROM ubuntu:rolling@sha256:eea047b4b181f2d3aeafbc0ce5294a2bbb3b98153a68b9ed4bc573d871ca9450

# Update the system, install OpenSSH Server, and set up users
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y openssh-server
# Uncomment sudo [optional]
# apt install sudo -y

#
RUN apt install software-properties-common -y
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install ansible -y
RUN ansible --version

# Set password for root user. Uncomment if want a password for root
RUN echo 'root:pass123' | chpasswd

# Create new user named ansible-usr
# https://www.freecodecamp.org/news/linux-how-to-add-users-and-create-users-with-useradd/
RUN useradd -m ansible-usr
RUN echo 'ansible-usr:pass123' | chpasswd

COPY .ssh/ /root/.ssh/

RUN chmod 700 /root/.ssh/
RUN chmod 600 /root/.ssh/authorized_keys
RUN chown -R root:root /root/.ssh/

# RUN cat /etc/ssh/sshd_config
# RUN cat /etc/pam.d/sshd

# Make ssh connection passwordless
RUN sed -i s/#PubkeyAuthentication/PubkeyAuthentication/g /etc/ssh/sshd_config

# Set up configuration for SSH
RUN mkdir -p /var/run/sshd/ && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile

# Expose the SSH port
EXPOSE 22

CMD echo STARTING SSH DAEMON... && \
    /usr/sbin/sshd -D
