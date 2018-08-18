class ntp_install {
  $pkg = 'ntp'
  $config = '/etc/ntp.conf'
  $servicename = 'ntpd'
  $drift = '/var/tmp/ntp/drift'
 
  package { "$pkg":
    ensure => installed,
  }

  file { "$config":
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    content => template('/root/First/puppet1/ntp.conf.erb'),
    require => Package[ "$pkg" ] 
  }

  service { "$servicename":
    ensure => running,
    enable => true,
    require => File[ "$config" ] 
  }  
   
}

include ntp_install
