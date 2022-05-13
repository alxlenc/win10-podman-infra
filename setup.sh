#!/bin/bash
zipped_box="win10Edge.box.zip"
box_name="win10Edge.box"

# echo -e "\nFetching Windows box\n"
# curl https://az792536.vo.msecnd.net/vms/VMBuild_20190311/Vagrant/MSEdge/MSEdge.Win10.Vagrant.zip -o $zipped_box

echo -e "\nUnzipping and renaming\n"
unzipped_file=$(unzip -Z1 ${zipped_box})
unzip $zipped_box
mv "$unzipped_file" "$box_name"

echo "Adding box"
vagrant box add win10 ./$box_name
vagrant up
echo "Done"

