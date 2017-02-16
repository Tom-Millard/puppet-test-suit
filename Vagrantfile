Vagrant.configure(2) do |config|
  conf = YAML.load_file("./boxes.yaml")
  conf['boxes'].each do |box|
    config.vm.define box['name'] do |node|
      node.vm.hostname = box['private_name']
      node.vm.network "private_network", ip: box["host"]
      node.vm.box = "http://192.168.1.140/boxes/centos-7-seLinux-on.box"
      node.vm.synced_folder './shared', "/shared", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
      node.ssh.pty = true

      memory = if box['memory'].nil? then 256 else box['memory'] end
      cpu = if box['cpu'].nil? then 1 else box['cpu'] end

      node.vm.provider :virtualbox do |vb|
        vb.name = box['name']
        vb.memory = memory
        vb.cpus = cpu
      end

      script = "sudo sh /shared/code/sh/common.sh; \n"
      script.concat("sudo sh /shared/code/sh/puppet-agent.sh; \n");

      if !box['shell'].nil?
        script.concat("sudo sh #{box['shell']}; \n")
      end

      if box['name'] != 'node-ns'
        script.concat("sudo cp /shared/templates/resolv.conf /etc; \n")
      end

      node.vm.provision "shell", inline: script, run: "always"

    end
  end
end
