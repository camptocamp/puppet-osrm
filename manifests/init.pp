class osrm {

  if $::lsbdistcodename != wheezy {
    fail "The ${module_name} module currently doesn't support ${::lsbdistcodename}"
  }

  package {'osrm':
    ensure => present,
  }

}
