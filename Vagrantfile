hosts = {
  "db1"  => {
    "ip"    => "192.168.123.11",
    "group" => "db"
  },
  "app1" => {
    "ip"    => "192.168.123.21",
    "group" => "app"
  },
  "app2" => {
    "ip"    => "192.168.123.22",
    "group" => "app"
  }
}

Vagrant.configure("2") do |config|
  hosts.each do |name, host_config|
    config.vm.define name do |machine|
      machine.vm.box = "lugons"
      machine.vm.box_url = "ftp://ftp.lugons.org/vagrant/debian-7.4.0-x86_64.box"
      machine.vm.hostname = name
      machine.vm.network :private_network, ip: host_config["ip"]
      machine.vm.provision :ansible do |ansible|
        ansible.playbook = "provision/site.yml"
        ansible.host_key_checking = false
        ansible.groups = {
          host_config["group"] => [name]
        }
      end
    end
  end
end
