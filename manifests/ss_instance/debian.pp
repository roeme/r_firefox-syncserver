# Class: r_firefox-syncserver::ss-instance::debian
#
#
class r_firefox_syncserver::ss_instance::debian {
  if $r_firefox_syncserver::manage_init == true {
    file { '/etc/systemd/system/syncserver.service':
      ensure  => file,
      content => template('r_firefox_syncserver/syncserver.service.erb')
    }
  }
  ensure_packages([
    'python-dev',
    'git-core',
    'python-virtualenv',
    'g++'
    ])
}