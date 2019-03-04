class profile::puppet::master::firewall {

  # Puppet master firewall rules
  Firewall {
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '110 allow PE Console access':           dport => '443';   }
  firewall { '110 allow PE Services API access':      dport => '4433';  }
  firewall { '110 allow PuppetDB access':             dport => '8081';  }
  firewall { '110 allow Puppet Server access':        dport => '8140';  }
  firewall { '110 allow Puppet PCP Broker access':    dport => '8142';  }
  firewall { '110 allow Puppet Orchestrator access':  dport => '8143';  }
  firewall { '110 allow Code Manager access':         dport => '8170';  }
  #MCollective/ActiveMQ was deprecated in 2018.4 and removed in 2019.0
  #firewall { '110 allow MCollective/ActiveMQ access': dport => '61613'; }

}


