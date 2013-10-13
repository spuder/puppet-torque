# Class: torque
#
# This module manages torque
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class torque (
  $torque_version = $torque::params::torque_version,
  $install_flags  = $torque::params::install_flags,
  $git_repo       = $torque::params::git_repo,
  $source_dir     = $torque::params::source_dir,
  $compile_cores  = $torque::params::compile_cores,
  
) inherits torque::params {
  
  
  include torque::packages
  include torque::setup
  include torque::compile
  
  anchor { 'torque::begin':}
  anchor { 'torque::end':}
  
  Anchor['torque::begin']     ->
  Class ['torque::packages']  ->
  Class ['torque::setup']     ->
  Class ['torque::compile']   ->
  Anchor['torque::end']
  
}
