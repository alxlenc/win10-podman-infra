#!/bin/bash

curl https://az792536.vo.msecnd.net/vms/VMBuild_20190311/Vagrant/MSEdge/MSEdge.Win10.Vagrant.zip -o win10Edge.box


vagrant box add win10 ./win10Edge.box
vagrant up

