FROM ubuntu:jammy@sha256:77906da86b60585ce12215807090eb327e7386c8fafb5402369e421f44eff17e AS generate_authorized_keys

RUN mkdir /.ssh

COPY .ssh/authorized_keys /.ssh/


# Use the official image as a parent image
FROM ubuntu:jammy@sha256:77906da86b60585ce12215807090eb327e7386c8fafb5402369e421f44eff17e

RUN apt update && apt install sudo -y

# RUN apt-get install -y openssh-server
# Update the system, install OpenSSH Server, and set up users
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server

# Create user and set password for user and root user
RUN  useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu && \
    echo 'ubuntu:priv' | chpasswd && \
    echo 'root:priv' | chpasswd

COPY --from=generate_authorized_keys /.ssh /home/ubuntu/.ssh

RUN chmod 700 /home/ubuntu/.ssh/
# RUN chmod 600 /home/ubuntu/.ssh/id_ed25519
# RUN chmod 644 /home/ubuntu/.ssh/id_ed25519.pub
RUN chmod 600 /home/ubuntu/.ssh/authorized_keys
RUN chown -R ubuntu /home/ubuntu/.ssh/

# Set up configuration for SSH
RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile

# Expose the SSH port
EXPOSE 22

CMD /usr/sbin/sshd && tail -f /dev/null
