class profile::puppet::master::autosign {
  ini_setting { 'policy-based autosigning':
    setting => 'autosign',
    path    => $settings::config,
    section => 'master',
    value   => '/opt/puppetlabs/puppet/bin/autosign-validator',
    notify  => Service['pe-puppetserver'],
  }
  
  class { ::autosign:
    ensure => 'latest',
    config => {
      'general' => {
        'loglevel' => 'DEBUG',
      },
      'jwt_token' => {
        'secret'   => 'hunter2',
        'validity' => '7200',
      }
    },
  }
}
