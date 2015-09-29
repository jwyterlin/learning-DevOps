# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "hashicorp/precise32"

  config.librarian_puppet.puppetfile_dir = "librarian"

  config.vm.define :db do |db_config|
    db_config.vm.network :private_network, :ip => "192.168.33.10"
    db_config.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules", "librarian/modules"]
      puppet.manifest_file = "db.pp"
    end
  end

  config.vm.define :web do |web_config|
    web_config.vm.network :private_network, :ip => "192.168.33.12"
    web_config.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules", "librarian/modules"]
      puppet.manifest_file = "web.pp"
    end
  end

  config.vm.define :monitor do |monitor_config|
    monitor_config.vm.network :private_network, :ip => "192.168.33.14"
  end

end
