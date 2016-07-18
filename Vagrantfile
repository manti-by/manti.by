# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "192.168.1.12"
  config.vm.network :forwarded_port, guest: 22, host: 2322, id: "ssh"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "./", "/home/vagrant/manti.by/src"
  config.vm.synced_folder "../log", "/home/vagrant/manti.by/log"
  
  config.vm.provision :shell, path: "bootstrap.sh"
end
