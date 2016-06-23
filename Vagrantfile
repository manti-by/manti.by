# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.1.12"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "./", "/vagrant/src"
  config.vm.synced_folder "../log", "/vagrant/log"
  
  config.vm.provision :shell, path: "bootstrap.sh"
end
