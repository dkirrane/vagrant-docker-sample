Vagrant.configure("2") do |config|
    config.vm.define "phusion" do |v|
        v.vm.provider "docker" do |d|
          d.cmd = ["/sbin/my_init", "--enable-insecure-key"]
          d.image = "phusion/baseimage"
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