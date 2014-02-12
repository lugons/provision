hosts = {
  "db1"  => "192.168.123.11",
  "app1" => "192.168.123.21",
  "app2" => "192.168.123.22"
}

Vagrant.configure("2") do |config|
  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.box = "lugons"
      machine.vm.box_url = "ftp://ftp.lugons.org/vagrant/debian-7.4.0-x86_64.box"
      machine.vm.host_name = "%s.lugons.org" % name
      machine.vm.network :private_network, ip: ip
      machine.vm.provision :ansible do |ansible|
        ansible.playbook = "provision/%s.yml" % name[0..-2]
        ansible.host_key_checking = false
        ansible.groups = {
          name[0..-2] => [name]
        }
      end
    end
  end
end
