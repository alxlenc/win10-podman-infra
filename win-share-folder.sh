#/bin/bash

if [[ -z "$1" || ! -d "$1" ]]; then
  echo "Usage: $0 <dir-to-mount>"
  exit 1
fi

curr_dir=$(basename $1)
win_vm=$(vboxmanage list vms | grep podman-infra_w10 | awk '{print $1}' | tr -d '"' )

echo -e "\nMounting $1 dir to $win_vm as $curr_dir\n"
vboxmanage sharedfolder remove $win_vm --name $curr_dir  --transient
vboxmanage sharedfolder add $win_vm --name $curr_dir --hostpath $1 --transient
echo  "Run the following command on windows: net use U: \\\\VBOXSVR\\"${curr_dir}
