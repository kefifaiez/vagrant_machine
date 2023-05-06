# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility).

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

# Provision docker Node
    
    config.vm.define "docker5" do |docker|
      docker.vm.hostname = "docker.clevory.local"
      docker.vm.provision "shell", path: "docker.sh"
      docker.vm.network "private_network", ip: "10.0.0.90"
      docker.vm.provider "virtualbox" do |vb|
        vb.memory = "2064"
        vb.name = "docker_test"
      end
    end
end