Vagrant.configure(2) do |config|
  conf = YAML.load_file("./boxes.yaml")
  conf['boxes'].each do |box|
    config.vm.define "node-#{box['name']}" do |node|
      node.vm.hostname = "node-#{box['name']}"
      node.vm.network "private_network", ip: box["host"]
      node.vm.box = "http://192.168.1.140/boxes/centos-7-seLinux-on.box"
      node.vm.synced_folder './shared', "/shared", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
      node.ssh.pty = true

      node.vm.provider :virtualbox do |vb|
        vb.name = "node-#{box['name']}"
        vb.memory = 256
        vb.cpus = 1
      end

      script = "sudo sh /shared/code/sh/common.sh; \n"

      if(!box['shell'].nil?)
        script.concat("sudo sh " + box['shell'] + "; \n");
      end

      Vagrant.configure("2") do |config|
        node.vm.provision "shell", inline: script
      end

    end
  end
end
