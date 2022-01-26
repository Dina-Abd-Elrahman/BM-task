
Vagrant.configure(2) do |config|

  # VM name 
  VM_NAME = 'vm'

  # Every Vagrant development environment requires a box (image). 
  VAGRANT_BOX = "bento/ubuntu-20.04"
  config.vm.box = VAGRANT_BOX

  # Actual machine name
  config.vm.hostname = VM_NAME  # Set VM name in Virtualbox
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = VM_NAME
    vb.memory = 4096 
  end 

  # Create port forwarding to be able to access the VM from outside (because of NATing)
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 9001, host: 9001

  # Copy docker-compose, python.Dockerfile into VM 
  config.vm.provision "file", source: "./docker-folder/.", destination: "$HOME/"
  config.vm.provision "shell", inline: <<-SHELL
  sed -i "s/IPAddr/$(hostname -I | cut -d ' ' -f1)/" /home/vagrant/uploader.py
  SHELL

 
  # Run docker conpose file using docker-compose plugin in vagrant

  config.vm.provision :docker
  config.vm.provision :docker_compose,
    yml: [
      "/home/vagrant/docker-compose.yml"
    ],
    run: "always"

end 