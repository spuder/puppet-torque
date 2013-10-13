class torque::setup inherits params {
  
  vcsrepo { "${torque::source_dir}/${torque::torque_version}":
    ensure   => present,
    provider => git,
    source   => "${torque::git_repo}",
    revision   => "${torque::torque_version}",
  }
  
  
}