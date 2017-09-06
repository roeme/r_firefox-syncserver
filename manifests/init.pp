# Class: r_firefox-syncserver
#
#
class r_firefox_syncserver(
  String        $version           = 'master',
  String        $user              = 'syncserver',
  Boolean       $manage_user       = true,
  String        $homedir           = "/home/${::r_firefox-syncserver::user}",
  String        $relsource         = "https://github.com/mozilla-services/syncserver/archive/${::r_firefox-syncserver::version}.zip",
  String        $public_url,
  Boolean       $manage_websrvcfg  = true,
  Enum['nginx'] $webserver         = 'nginx',
  Enum['unix','tcp'] $socktype     = 'unix',
  String        $bind              = 'unix:/tmp/syncserver.sock',
  Boolean       $manage_init       = true,
  Boolean       $use_sqlite        = true,
  Optional[String] $sqluri,
  Boolean       $allow_new_users   = true,
  ) {

  if ($use_sqlite == false) && $sqluri = undef {
    fail('Must provide an $sqluri if not using sqlite')
  }

}