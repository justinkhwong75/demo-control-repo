class profile::puppet::master::gitea {

  class { 'gitea':
      package_ensure         => 'present',
      dependencies_ensure    => 'present',
      dependencies           => ['curl', 'git', 'tar'],
      manage_user            => true,
      manage_group           => true,
      manage_home            => true,
      owner                  => 'git',
      group                  => 'git',
      home                   => '/home/git',
      version                => '1.4.1',
      checksum               => 'd8cfa0d39da70497f1f75e519e4fee33e5ee7c0de88919bdfe46a8b0d38af851',
      checksum_type          => 'sha256',
      installation_directory => '/opt/gitea',
      repository_root        => '/var/git',
      log_directory          => '/var/log/gitea',
      attachment_directory   => '/opt/gitea/data/attachments',
      configuration_sections => {},
      manage_service         => true,
      service_template       => 'gitea/systemd.erb',
      service_path           => '/lib/systemd/system/gitea.service',
      service_provider       => 'systemd',
      service_mode           => '0644',
  }

  firewall{ '100 allow web connections':
    proto  => 'tcp',
    dport  => 3000,
    action => accept,
  }
}