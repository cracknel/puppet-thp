# Class: thp
# Manages Transparent Huge Pages settings
#
# @summary Disables Transparent Huge Pages using systemd
#
# @example
#   include thp
class thp {
  # Create systemd service to disable THP
  file { '/etc/systemd/system/disable-thp.service':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => @("EOT")
[Unit]
Description=Disable Transparent Huge Pages
After=sysinit.target
DefaultDependencies=no

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
ExecStart=/bin/sh -c 'echo never > /sys/kernel/mm/transparent_hugepage/defrag'
RemainAfterExit=yes

[Install]
WantedBy=sysinit.target
EOT
    ,
    notify  => Service['disable-thp'],
  }

  # Enable and start the service
  service { 'disable-thp':
    ensure => 'running',
    enable => true,
  }

  # Verify current status
  exec { 'verify-thp-disabled':
    command => 'grep -q "\\[never\\]" /sys/kernel/mm/transparent_hugepage/enabled',
    path    => ['/usr/bin', '/bin'],
    unless  => 'grep -q "\\[never\\]" /sys/kernel/mm/transparent_hugepage/enabled',
    require => Service['disable-thp'],
  }
}
