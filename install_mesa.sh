#!/bin/sh

echo ""
echo "This script will install Mesa 21.3.1 from the Official github release onto your system."
echo "NOTE, only run this if you are sure this is what you want."
echo "Read this script for more details."
echo ""
read -r -p "Go ahead? [Y/n] " input

case $input in
      [yY][eE][sS]|[yY])
            echo "Installing from https://github.com/mesa3d/mesa/archive/refs/tags/mesa-21.3.1.zip"
            echo ""
            cd third-party/
	    git clone https://github.com/mesa3d/mesa.git
	    cd mesa
	    
	    # Mesa dependencies
	    sudo apt install libgbm-dev
	    sudo apt install meson
	    sudo pip3 install mako
	    sudo apt install bison byacc flex
	    sudo apt install libxcb-glx0-dev libxcb-shm0-dev libxcb-dri2-0-dev libxcb-present-dev
	    sudo apt install libxshmfence-dev
	    sudo apt install libx11-xcb-dev
	    sudo apt install libxcb-dri3-dev
	    
	    meson --prefix /usr --libdir lib -Dplatforms=x11 -Dvulkan-drivers=broadcom -Ddri-drivers= -Dgallium-drivers=v3d,kmsro,vc4,virgl  -Dbuildtype=release build
	    echo ""
	    echo "Compiling about to start. This will take a while"
	    echo ""
	    ninja -C build -j3
	    sudo ninja -C build install

	    echo ""
	    echo "Mesa 21.3.1 install finished"
	    echo ""
            ;;
      [nN][oO]|[nN])
            echo "Exiting script"
            exit 1
            ;;
      *)
            echo "Invalid input"
            exit 1
            ;;
esac
