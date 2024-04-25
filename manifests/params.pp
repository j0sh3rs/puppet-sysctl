# @summary Sysctl Params Class
#
# @example Basic Usage
# $::sysctl::params::sysctl_dir
class sysctl::params {

  $_os_family = $facts['os']['family']

  # Keep the original symlink if we purge, to avoid ping-pong with initscripts
  if ($_os_family == 'RedHat' and
      versioncmp(facts['os']['release']['major'], '7') >= 0) or
  ($_os_family == 'Debian' and
    versioncmp(facts['os']['release']['major'], '8') >= 0) {
    $symlink99 = true
  } else {
    $symlink99 = false
  }

  case $_os_family {
    'FreeBSD': {
      $sysctl_dir = false
    }
    default: {
      $sysctl_dir = true
      $sysctl_dir_path = '/etc/sysctl.d'
      $sysctl_dir_owner = 'root'
      $sysctl_dir_group = 'root'
      $sysctl_dir_mode = '0755'
    }
  }

}

