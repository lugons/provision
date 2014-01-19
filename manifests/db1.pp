import 'base'

class { 'postgresql::server':
  listen_addresses        => '*',
  ip_mask_allow_all_users => '0.0.0.0/0',
}

postgresql::server::db { 'redmine':
  user     => 'redmine',
  password => postgresql_password('redmine', hiera('redmine_password')),
  encoding => 'UTF-8',
}

postgresql::server::db { 'meka_mezzanine':
  user     => 'meka',
  password => postgresql_password('meka', hiera('mezzanine_meka_password')),
  encoding => 'UTF-8',
}
