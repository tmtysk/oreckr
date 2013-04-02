# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "DebianSqueeze32-vanilla"
  config.vm.box_url = "https://dl.dropbox.com/u/2289657/squeeze32-vanilla.box"
  config.vm.network :private_network, ip: "192.168.33.250"
  config.vm.network :forwarded_port, guest: 3000, host: 63000

  config.ssh.forward_agent = true

  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  config.vm.synced_folder ".", "/vagrant", :nfs => nfs_setting

  chef_cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = chef_cookbooks_path
    chef.add_recipe "railsapp"
  end
end
