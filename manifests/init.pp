# Class: puppet-syntax-vim
# ===========================
#
# Full description of class puppet-syntax-vim here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'puppet-syntax-vim':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class puppet_syntax_vim {

  file { '/root/.vim':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

  $plugin_dirs = [
    'ftdetect',
    'ftplugin',
    'indent',
    'syntax',
  ]

  $plugin_dirs.each |String $dir| {
    file { "/root/.vim/${dir}":
      ensure  => directory,
      source  => "puppet:///modules/${module_name}/puppet-syntax-vim/${dir}",
      recurse => true,
      owner   => 'root',
      group   => 'root',
      require => File['/root/.vim']
    }
  }

  file { '/root/.vimrc':
    ensure  => file,
    source  => "puppet:///modules/${module_name}/vimrc",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
