# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04.2-amd64"
  config.vm.box_url = "https://dl.dropbox.com/u/2894322/ubuntu-12.04.2-amd64.box"

  config.berkshelf.enabled = true

  config.vm.network :forwarded_port, guest: 8083, host: 8083
  config.vm.network :forwarded_port, guest: 7072, host: 7072

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "fhem"
  end

end
