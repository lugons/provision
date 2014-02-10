Vagrant::Config.run do |config|
  {
    :db1 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/debian-7.4.0-x86_64.box',
      :addr    => '192.168.123.11',
    },
    :app1 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/debian-7.4.0-x86_64.box',
      :addr    => '192.168.123.21',
    },
    :app2 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/debian-7.4.0-x86_64.box',
      :addr    => '192.168.123.22',
    },
  }.each do |name,cfg|
    config.vm.define name do |local|
      local.vm.box = cfg[:box]
      local.vm.box_url = cfg[:box_url]
      local.vm.network :hostonly, cfg[:addr]
      local.vm.host_name = ENV['VAGRANT_HOSTNAME'] || name.to_s.downcase.gsub(/_/, '-').concat(".lugons.org")
      local.vm.provision :ansible do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
      end
    end
  end
end
