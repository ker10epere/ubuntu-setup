# Use the official image as a parent image
FROM ubuntu:rolling@sha256:eea047b4b181f2d3aeafbc0ce5294a2bbb3b98153a68b9ed4bc573d871ca9450

RUN mkdir /root/.ssh/

COPY .ssh/authorized_keys /root/.ssh/

#    https://jonasbn.github.io/til/ssh/permissions_on_ssh_folder_and_files.html
#    .ssh/   700 (drwx------)
#    public key (.pub file)   644 (-rw-r--r--)
#    private key (id_rsa)     600 (-rw-------)
#    Your home directory should not be writeable by the group or others: 755 (drwxr-xr-x).
#    Configuration file: .ssh/config          600 (-rw-------)
#    authorized_keys          600 (-rw-------)

RUN chmod 700 /root/.ssh/
# RUN chmod 600 /home/ubuntu/.ssh/id_ed25519
# RUN chmod 644 /home/ubuntu/.ssh/id_ed25519.pub
RUN chmod 600 /root/.ssh/authorized_keys
RUN chown -R root /root/.ssh/

RUN apt update && apt install sudo -y

# RUN apt-get install -y openssh-server
# Update the system, install OpenSSH Server, and set up users
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server

# Set password for root user
RUN echo 'root:priv' | chpasswd


# RUN chmod 700 /home/ubuntu/.ssh/
# # RUN chmod 600 /home/ubuntu/.ssh/id_ed25519
# # RUN chmod 644 /home/ubuntu/.ssh/id_ed25519.pub
# RUN chmod 600 /home/ubuntu/.ssh/authorized_keys
# RUN chown -R ubuntu /home/ubuntu/.ssh/

# Set up configuration for SSH
RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile

# Expose the SSH port
EXPOSE 22

CMD /usr/sbin/sshd && tail -f /dev/null
