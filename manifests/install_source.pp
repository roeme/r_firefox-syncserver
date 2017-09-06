# Class: r_firefox_syncserver::install_source
#
#
class r_firefox_syncserver::install_source {
  include archive
  archive { "/tmp/r_firefox_syncserver-source-${version}.tar.gz":
    ensure        => present,
    extract       => true,
    extract_path  => "${::r_firefox_syncserver::homedir}",
    source        => "${::r_firefox_syncserver::relsource}",
    creates       => "${::r_firefox_syncserver::homedir}/syncserver-${version}",
    cleanup       => true,
  }
  file { "${::r_firefox_syncserver::homedir}/syncserver":
    ensure        => 'link',
    target        => "${::r_firefox_syncserver::homedir}/syncserver-${version}",
    require       => Archive["/tmp/r_firefox_syncserver-source-${version}.tar.gz"],
  }
}