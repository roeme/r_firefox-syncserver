# Class: r_firefox_syncserver::configure_ss
#
#
class r_firefox_syncserver::configure_ss {
  if $::r_firefox_syncserver::use_sqlite {
    $t_sqluri = "$::r_firefox_syncserver::homedir/data.db",
  } else {
    $t_sqluri = $::r_firefox_syncserver::sqluri
  }

  include stdlib
  $t_secret = fqdn_rand_string(20)

  file { "$::r_firefox_syncserver::homedir/syncserver/syncserver.ini":
    ensure  => file,
    content => template('r_firefox_syncserver/syncserver.ini.erb'),
    user    => "$::r_firefox_syncserver::user",
    mode    => 0644,
    require => File["${::r_firefox_syncserver::homedir}/syncserver"],
  }
}