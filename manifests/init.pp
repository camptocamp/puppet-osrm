# OSRM install
class osrm ($ensure = present){

  if $::lsbdistcodename != wheezy {
    fail "The ${module_name} module currently doesn't \
    support ${::lsbdistcodename}"
  }

  $d_ensure = $ensure? {
    present => 'directory',
    default => $ensure
  }

  package {'osrm':
    ensure => $ensure,
  }->
  user {'osrm':
    ensure => $ensure,
    system => true,
  }->
  file {'/var/log/osrm':
    ensure => $d_ensure,
    owner  => 'osrm',
    group  => 'osrm',
    mode   => '0755',
  }

}
