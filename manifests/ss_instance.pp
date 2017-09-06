# Class: r_firefox-syncserver::ss_instance
#
#
class r_firefox_syncserver::ss_instance {
  if $::r_firefox_syncserver::manage_user {
    user { ${::r_firefox_syncserver::user}:
      ensure  => present,
      comment => 'Firefox Sync Server System User',
      home    => "${::r_firefox_syncserver::homedir}",
      system  => true,
    }
  }

  include r_firefox_syncserver::install_source
  include r_firefox_syncserver::configure_ss

  case $osfamily {
    'Debian': {
      include r_firefox_syncserver::ss_instance::debian
    }
    default: {
      fail("Unknown \$osfamily: ${osfamily}")
    }
  }
}