rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf makecache

dnf -y install vim vim-X11 gazebo 
dnf -y install mplayer vlc gnome-tweak-tool  
dnf -y install unrar rednotebook gtksourceview3 tcsh xchm  nautilus-open-terminal axel audacity 
dnf -y install kate dia filezilla minicom amule syslinux-tftpboot lzma squashfs-tools pwgen libstdc++-docs
dnf -y install wqy* gimp boost-devel libusb-devel convmv lsb libgcrypt libreoffice-langpack-zh-Hans 
dnf -y install readline-devel smplayer gnome-calendar firewall-config

dnf -y install tigervnc-server tigervnc  

dnf install umbrello lcov astyle python-xlrd p7zip sshfs -y

# shell extension
dnf install gnome-shell-extension-common gnome-shell-extension-user-theme gnome-shell-extension-native-window-placement gnome-shell-extension-places-menu gnome-shell-extension-openweather.noarch -y

# OLA - https://wiki.openlighting.org/index.php
dnf install flex bison protobuf protobuf-devel uuid-devel cppunit-devel libmicrohttpd-devel libusb-devel libftdi-devel libuuid-devel openslp-devel -y

# Virutalbox
dnf install VirtualBox.x86_64 akmod-VirtualBox.x86_64 VirtualBox-kmodsrc -y

# debug info for CPP
#dnf debuginfo-install libgcc libstdc++ -y
dnf libstdc++ libstdc++-devel.i686 codeblocks.x86_64 codeblocks-contrib.x86_64 -y

# others
dnf install -y kdenlive asciidoc w3m dblatex libguestfs-tools 

dnf -y group install "C Development Tools and Libraries" "Development Tools"

# QT5
dnf -y install qt5-*.noarch  qt5-*.x86_64 qt-creator  
dnf -y install rpm-build apr-devel libcurl-devel mxml-devel apr-util-devel opencv-devel qt5-qtconnectivity-devel qt5-qtserialport-devel qt5-qtmultimedia-devel qt5-qtquickcontrols2-devel qt5-qtcharts-devel
dnf -y install gstreamer-{ffmpeg,plugins-{bad,ugly}}

# for CC build
dnf install -y fdupes laszip-devel liblas-devel pcl-devel CUnit-devel shapelib-devel xerces-c-devel CGAL-devel tbb-devel qt-devel PDAL-devel opencascade-devel ffmpeg-devel  flann-devel mpir-devel

# for openMVG & openMVS
dnf install -y coin-or-lemon-devel.x86_64 coin-or-Clp-devel.x86_64 vcglib-devel.x86_64 clang

# Flash
rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
dnf -y install flash-plugin

dnf -y install foliate calibre


dnf update -y

### Setting Up
systemctl enable sshd.service


#install ROS
dnf copr enable thofmann/ros
dnf install -y ros-desktop_full*
mkdir /opt/ros
pushd /opt/ros
ln -s /usr/lib64/ros noetic
popd
echo "source /usr/lib64/ros/setup.bash" >> ~/.bashrc

dnf install python3-catkin_tools python3-rosinstall_generator.noarch python3-wstool.noarch ros-geographic_msgs-devel.noarch GeographicLib-devel.x86_64 libatomic.x86_64
dnf install gcc-c++ python3-rosdep python3-rosinstall_generator python3-vcstool @buildsys-build

#install vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install -y code

# for PX4-Autopilot build
pip3 install --user kconfiglib empy pyyaml pyros-genmsg packaging toml  jsonschema future
