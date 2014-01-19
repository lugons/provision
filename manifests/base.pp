class { 'apt':
  purge_sources_list   => true,
  purge_sources_list_d => true,
  purge_preferences_d  => true,
}

apt::source { 'official':
  location => 'http://cdn.debian.net/debian/',
  repos    => 'main',
}

apt::source { 'updates':
  location => 'http://cdn.debian.net/debian/',
  release  => 'wheezy-updates',
  repos    => 'main',
}

apt::source { 'security':
  location => 'http://security.debian.org/',
  release  => 'wheezy/updates',
  repos    => 'main',
}

apt::source { 'puppetlabs':
  location   => 'http://apt.puppetlabs.com',
  repos      => 'main dependencies',
  key        => '4BD6EC30',
  key_server => 'pgp.mit.edu',
}
