# = Class: torque::compile
#
# This class installs torque by compiling it from upstream source
#
#
class torque::compile inherits params {
  
  Exec {
    path    => '/bin:/usr/bin:/usr/sbin/:/usr/local/',
    cwd     => "${torque::source_dir}/${torque::torque_version}",
    
  }
  
  exec {'autoconf': 
    command => 'autoconf',
  }
  
  exec {'autogen':
    command => "${torque::source_dir}/${torque::torque_version}/autogen.sh",
    require => Exec ['autoconf']
  }
  
  exec {'configure':
    command => "${torque::source_dir}/${torque::torque_version}/configure ${torque::install_flags} --with-debug",
    require => [
      Exec ['autoconf'],
      Exec ['autogen'],
      ]
  }
  
  exec {'make':
    command => "make -j ${torque::compile_cores}",
    require => [
          Exec ['configure'],
          Exec ['autoconf'],
          Exec ['autogen'],
          ]
  }
  
   exec {'make install':
    command => 'make install',
    require => [
          Exec ['configure'],
          Exec ['autoconf'],
          Exec ['autogen'],
          Exec ['make'],
          ]
  }
  
  
}