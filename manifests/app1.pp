import 'base'

package { 'python-pip':
    ensure => installed,
}

package { 'python-dev':
    ensure => installed,
}

package { 'build-essential':
    ensure => installed,
}

package { 'mezzanine':
    ensure    => installed,
    provider  => pip,
    subscribe => Package['python-pip', 'python-dev', 'build-essential'],
}

class { 'nginx': }

nginx::resource::upstream { 'meka_lugons_org':
  ensure    => present,
  members => ['unix:/var/run/gunicorn/meka.lugons.org.sock'],
}

nginx::resource::vhost { 'meka.lugons.org':
  ensure  => present,
  proxy => 'http://meka_lugons_org',
}
