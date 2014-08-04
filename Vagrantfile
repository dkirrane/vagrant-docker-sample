##
#
# https://github.com/phusion/baseimage-docker#login_ssh
#
# Setup SSH key
# curl -o insecure_key -fSL https://github.com/phusion/baseimage-docker/raw/master/image/insecure_key
# chmod 600 insecure_key
#
#
# Run:
# vagrant up
# vagrant up --provider=docker --debug
#
# vagrant docker-logs
# vagrant global-status --prune
# vagrant status
# vagrant ssh
# vagrant reload
# vagrant destroy
#
###

VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure("2") do |config|

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.define "phusion" do |v|
    v.vm.provider "docker" do |d|
      d.build_dir = "./Docker"
      d.name = 'dockerizedvm'
      d.has_ssh = true
      #d.force_host_vm = true
    end
    v.ssh.port = 22
    v.ssh.username = 'root'
    v.ssh.private_key_path = 'insecure_key'
    v.vm.provision "shell", inline: "echo hello"
    #v.vm.synced_folder "./keys", "/vagrant"
  end
end
