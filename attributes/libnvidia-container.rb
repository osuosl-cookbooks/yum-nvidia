default['yum']['libnvidia-container']['baseurl'] =
  'https://nvidia.github.io/libnvidia-container/centos$releasever/$basearch'
default['yum']['libnvidia-container']['gpgcheck'] = false
default['yum']['libnvidia-container']['gpgkey'] = 'https://nvidia.github.io/libnvidia-container/gpgkey'
default['yum']['libnvidia-container']['repo_gpgcheck'] = true
default['yum']['libnvidia-container']['sslcacert'] = '/etc/pki/tls/certs/ca-bundle.crt'
default['yum']['libnvidia-container']['sslverify'] = true
default['yum']['libnvidia-container']['description'] = 'libnvidia-container'
default['yum']['libnvidia-container']['enabled'] = true
default['yum']['libnvidia-container']['failovermethod'] = 'priority'
default['yum']['libnvidia-container']['make_cache'] = true
default['yum']['libnvidia-container']['managed'] = true
default['yum']['libnvidia-container']['repositoryid'] = 'libnvidia-container'
