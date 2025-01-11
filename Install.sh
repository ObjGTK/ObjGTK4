#/bin/sh

installDirs=("OGPango" "OGdkPixbuf" "OGdk4" "OGsk4" "ObjGTK4")

for d in ${installDirs[@]}
do
	printf "\nEntering directory $d…\n\n"
    cd $d
	./autogen.sh && ./configure
	make -j4
	sudo make install
	cd ..
done