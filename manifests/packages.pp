class torque::packages inherits params {
  
  case $operatingsystem {
    CentOS,RedHat: {     
      notify {"the os is a cent machine":}          
                    $openssl_devel    = 'openssl-devel'
                    $libxml2_devel    = 'libxml2-devel'
                    $c_plus_compiler  = "gcc-c++"
                    }
	
	  Debian,Ubuntu: {
	    notify {"the os is a debian machine":}   
                    $openssl_devel    = 'libssl-dev'
	                  $libxml2_devel    = 'libxml2-dev'
                    $c_plus_compiler  = 'build-essential'
                    }
    
    default:{ warning("Opperating System not supported") }
  }
  
  
  $system_packages = [  'git','gcc','libtool','autoconf','make',$libxml2_devel,$openssl_devel,$c_plus_compiler, ]

  package {$system_packages:
    ensure  => present,
  }
    
  
}