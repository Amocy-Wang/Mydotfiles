#!/bin/bash
cd ~
mkdir Downloads
mkdir installs
mkdir projects
mkdir Softwares
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install vim tmux autoconf automake bison build-essential clang doxygen flex g++ git libncurses5-dev libtool libsqlite3-dev make mcpp python sqlite zlib1g-dev subversion tree iotop gawk m4 zsh gcc-multilib g++-multilib libssl-dev curl zip
cd ~/Downloads
wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2 && wget https://www.mpfr.org/mpfr-current/mpfr-4.0.2.tar.bz2 && wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz 
tar xvf gmp-6.1.2.tar.bz2 -C ~/Softwares && tar xvf mpfr-4.0.2.tar.bz2 -C ~/Softwares && tar xvf mpc-1.1.0.tar.gz -C ~/Softwares
echo "export GMP_INSTALL=/home/guancheng/installs/gmp-6.1.2" >> ~/.zshrc
echo "export MPC_INSTALL=/home/guancheng/installs/mpc-1.1.0" >> ~/.zshrc
echo "export MPFR_INSTALL=/home/guancheng/installs/mpfr-4.0.2" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=\$GMP_INSTALL/lib:\$MPC_INSTALL/lib:\$MPFR_INSTALL/lib:\$LD_LIBRARY_PATH" >> ~/.zshrc
cd ~/Softwares/gmp-6.1.2 && ./configure --prefix=/home/guancheng/installs/gmp-6.1.2 && make -j4 && make install
cd ~/Softwares/mpfr-4.0.2 && ./configure --prefix=/home/guancheng/installs/mpfr-4.0.2 --with-gmp=/home/guancheng/installs/gmp-6.1.2 && make -j4 && make install
cd ~/Softwares/mpc-1.1.0 && ./configure --prefix=/home/guancheng/installs/mpc-1.1.0 --with-gmp=/home/guancheng/installs/gmp-6.1.2 --with-mpfr=/home/guancheng/installs/mpfr-4.0.2 && make -j4 && make install

# install the lastest cmake 
# (CHISEL dependency) sudo apt-get install clang-8-dev llvm-8-dev && manually install the lastest version of spdlog and mlpack. You can change the llvm-config version to specify the llvm-related libraries and include files.

