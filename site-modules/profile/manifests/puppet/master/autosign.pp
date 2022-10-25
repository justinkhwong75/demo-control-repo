class profile::puppet::master::autosign {
  ini_setting { 'policy-based autosigning':
    setting => 'autosign',
    path    => $settings::config,
    section => 'master',
    value   => '/usr/local/bin/autosign-validator',
    notify  => Service['pe-puppetserver'],
  }
}
