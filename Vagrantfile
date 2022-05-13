Vagrant.configure("2") do |config|

  config.vm.define "w10" do |w10|

    w10.vm.box = "win10"
    w10.vm.box_url = "file://./win10Edge.box"
    

    w10.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct:true
    # Port forward for WinRM
    w10.vm.network :forwarded_port, guest: 5986, host: 5986, id: "winrm-ssl", auto_correct:true
    w10.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct:true
  

    w10.vm.boot_timeout      = 1000
    w10.vm.communicator      = "winrm"
    w10.vm.guest             = :windows
    w10.windows.halt_timeout = 15
    w10.winrm.password       = "Passw0rd!"
    w10.winrm.retry_limit    = 30
    w10.winrm.username       = "ieuser"

    w10.vm.network "private_network", ip: "192.168.56.2"

    w10.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 3
      v.gui = true
      v.customize ["modifyvm", :id, "--vram", "128"]
  		v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    # w10.vm.provision "shell", inline: "Set-WinUserLanguageList es-ES -Force"

  end

  config.vm.define "f36" do |f36|

    f36.vm.box = "fedora/36-cloud-base"
    f36.vm.box_version = "36-20220504.1"
    f36.vm.hostname = "podman-vm"

    f36.vm.network "private_network", ip: "192.168.56.3"

    f36.vm.synced_folder ".", "/vagrant", type: "rsync", disabled: true

    f36.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 3
    end

    f36.vm.provision "shell", path: "scripts/fedora/setup.sh"

  end

end
