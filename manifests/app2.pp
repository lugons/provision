import 'base'

class { 'nginx': }

nginx::resource::upstream { 'redmine_thin_app':
  ensure    => present,
  members => [
    'unix:/var/run/thin/redmine.lugons.org.0.sock',
    'unix:/var/run/thin/redmine.lugons.org.1.sock',
    'unix:/var/run/thin/redmine.lugons.org.2.sock',
    'unix:/var/run/thin/redmine.lugons.org.3.sock',
  ],
}

nginx::resource::vhost { 'redmine.lugons.home':
  ensure => present,
  proxy  => 'http://redmine_thin_app',
}

package { [
            'postgresql-server-dev-all',
            'libmagickwand-dev',
            'ruby-dev',
          ]:
  ensure => present;
}

package { 'bundle' :
  ensure   => present,
  provider => 'gem';
}

file { '/var/www/':
  ensure => directory;
}

file { '/var/www/lugons.org/' :
  ensure => directory;
}

file { '/var/www/lugons.org/redmine/current/' :
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
}

class { 'thin::site':
  subdomain => 'redmine',
  domain    => 'lugons.org',
}

class { 'gitolite':
  path          => '/home/git',
  admin_pub_key => hiera('gitolite_admin_pub_key'),
}
