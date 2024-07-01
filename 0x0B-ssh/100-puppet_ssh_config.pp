#!/usr/bin/env bash
#ascriot that connects to server without passkey
file {'/etc/ssh/ssh_config':
  ensure  => 'present',
}
file_line {'Turn off passwd auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => 'PasswordAuthentication yes',
  replace => 'true',
}
file_line {'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentifyFile ~/.ssh/school',
  match  => '^IdentifyFile',
  ensure => 'present',
}
