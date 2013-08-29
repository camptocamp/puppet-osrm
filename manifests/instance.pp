define osrm::instance (
  $data_dir,
  $ensure  = 'present',
  $threads = 8,
  $ip      = '127.0.0.1',
  $port    = '5000',
) {

  $service_name = "osrm-${name}"

  file {"/etc/init.d/${service_name}":
    ensure  => $ensure,
    mode    => '0755',
    content => template("${module_name}/init.erb"),
  }

  if $ini_template != undef {
    $ini_content = template($ini_template)
  } else {
    $ini_content = undef
  }

  file {"/etc/osrm/server-${name}.ini":
    ensure  => file,
    content => template('osrm/server.ini.erb'),
  }

  $service_ensure = $ensure ? {
    'present' => 'running',
    'absent'  => 'stopped',
  }
  service {$service_name:
    ensure    => $service_ensure,
    hasstatus => true,
    require   => [ File["/etc/init.d/${service_name}"],
                   Class['osrm'] ],
  }
    
}
