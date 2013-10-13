# = Class torque
#
#
#
class { 'torque' : 
  torque_version  => '4.2.5',
  install_flags   => '--with-debug',
  
}