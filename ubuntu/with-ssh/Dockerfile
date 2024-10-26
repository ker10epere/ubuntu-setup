# Use the official image as a parent image
FROM ubuntu:rolling@sha256:eea047b4b181f2d3aeafbc0ce5294a2bbb3b98153a68b9ed4bc573d871ca9450

# RUN apt-get install -y openssh-server
# Update the system, install OpenSSH Server, and set up users
RUN apt update -y && \
    apt install sudo -y && \
    apt-get upgrade -y && \
    apt-get install -y openssh-server

# Set password for root user. Uncomment if want a password for root
RUN echo 'root:pass123' | chpasswd

COPY .ssh/ /root/.ssh/

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
RUN chown -R root:root /root/.ssh/

# RUN chmod 700 /home/ubuntu/.ssh/
# # RUN chmod 600 /home/ubuntu/.ssh/id_ed25519
# # RUN chmod 644 /home/ubuntu/.ssh/id_ed25519.pub
# RUN chmod 600 /home/ubuntu/.ssh/authorized_keys
# RUN chown -R ubuntu /home/ubuntu/.ssh/

# RUN cat /etc/ssh/sshd_config
# RUN cat /etc/pam.d/sshd

# Set up configuration for SSH
RUN mkdir -p /var/run/sshd/ && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile

# Expose the SSH port
EXPOSE 22

CMD /usr/sbin/sshd && echo WORKING!!! && sleep infinity
