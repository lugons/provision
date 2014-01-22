Vagrant::Config.run do |config|
  {
    :db1 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/lugons-debian-7.2-x86_64.box',
      :addr    => '192.168.123.11',
    },
    :app1 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/lugons-debian-7.2-x86_64.box',
      :addr    => '192.168.123.21',
    },
    :app2 => {
      :box     => 'lugons',
      :box_url => 'ftp://ftp.lugons.org/vagrant/lugons-debian-7.2-x86_64.box',
      :addr    => '192.168.123.22',
    },
  }.each do |name,cfg|
    config.vm.define name do |local|
      local.vm.box = cfg[:box]
      local.vm.box_url = cfg[:box_url]
      local.vm.network :hostonly, cfg[:addr]
      local.vm.host_name = ENV['VAGRANT_HOSTNAME'] || name.to_s.downcase.gsub(/_/, '-').concat(".lugons.org")
      local.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = name.to_s.concat(".pp")
        puppet.options = [
         '--verbose',
#        '--debug',
        ]
      end
    end
  end
end
