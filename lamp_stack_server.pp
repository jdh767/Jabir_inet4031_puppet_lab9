file { '/var/www/html/phpinfo.php':
  source => '/home/jadh/jadh_inet4031_puppet_lab9/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}

package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}

package { 'libapache2-mod-php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'php-cli':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'php-mysql':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'mariadb-server':
  ensure => installed,
}

service { 'mariadb-server':
  name => mariadb,
}
