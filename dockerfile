#### ABOUT HOW TO USE ###########
# 1) REPLACE THE CONTENT AT LINE 13 WITH ACCURATE TEXT.
# 2) docker build -t sshubuntu .
# 3) docker run -d -p FREE_PORT_NUM:22 sshubuntu
# 4) ssh -i idkey root@localhost -p 2022
FROM ubuntu:16.04
RUN apt-get --assume-yes update
RUN apt-get --assume-yes install vim tmux autoconf automake bison build-essential clang doxygen flex g++ git libncurses5-dev libtool libsqlite3-dev make mcpp python sqlite zlib1g-dev subversion tree iotop gawk m4 zsh gcc-multilib g++-multilib libssl-dev
RUN apt update && apt install  openssh-server sudo -y
# Create sshuser directory in home
RUN mkdir -p /.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
RUN echo "THE CONTENT IN YOUR LOCAL id_rsa.pub" >> ~/.ssh/authorized_keys
RUN cat ~/.ssh/authorized_keys >> ~/.ssh/idkey.pub
# change ownership of the key file.
RUN chmod 600 /.ssh/authorized_keys
# Start SSH service
RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
