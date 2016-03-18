# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 8080

  config.vm.synced_folder ".", "/bookin"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    if [ ! -f "/usr/local/rvm/scripts/rvm" ]; then
      sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3;
      curl -sSL https://get.rvm.io | bash -s stable --ruby;
      source /usr/local/rvm/scripts/rvm;
      rvm install 2.2 && rvm use 2.2;
      sudo usermod -a -G rvm vagrant
      gem install rails
      sudo apt-get install nodejs
    fi
  SHELL
end
