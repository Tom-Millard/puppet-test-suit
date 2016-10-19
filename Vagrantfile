Vagrant.configure(2) do |config|
  conf = YAML.load_file("./boxes.yaml")
  conf['boxes'].each do |box|
    config.vm.define "node-#{box['name']}" do |node|
      node.vm.hostname = "node-#{box['name']}"
      node.vm.network "private_network", ip: box["host"]
      node.vm.box = "http://192.168.1.140/boxes/efiling-centos-7.box"
      node.vm.synced_folder './shared', "/vagrant", :nfs => { :mount_options => ["dmode=777","fmode=666"] }
      node.ssh.pty = true

      node.vm.provider :virtualbox do |vb|
        vb.name = "node-#{box['name']}"
        vb.memory = 256
        vb.cpus = 1
      end

      node.vm.provision "shell" do |s|
          s.inline = "
            sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
            sudo yum -y install wget puppet;
          "
      end

    end
  end
end
