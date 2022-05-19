#/bin/bash

if [[ -z "$1" || ! -d "$1" ]]; then
  echo "Usage: $0 <dir-to-mount>"
  exit 1
fi

curr_dir=$(basename $1)
win_vm=$(vboxmanage list vms | grep podman-infra_w10 | awk '{print $1}' | tr -d '"' )

echo "Sharing $1 dir with $win_vm as $curr_dir"
echo
vboxmanage sharedfolder remove $win_vm --name $curr_dir  --transient
vboxmanage sharedfolder add $win_vm --name $curr_dir --hostpath $1 --transient
echo
echo "Mounting $1 on windows drive U:"
vagrant winrm w10  \
  -c "ECHO Y|NET USE U: /DELETE" \
  -c  "NET USE U: \\\\VBOXSVR\\$curr_dir"

echo
echo "Done."


