default['yum']['nvidia-container-runtime']['baseurl'] = platform('almalinux') ?
  'https://nvidia.github.io/nvidia-container-runtime/rhel$releasever/$basearch' :
  'https://nvidia.github.io/nvidia-container-runtime/centos$releasever/$basearch'
default['yum']['nvidia-container-runtime']['gpgcheck'] = false
default['yum']['nvidia-container-runtime']['gpgkey'] = 'https://nvidia.github.io/nvidia-container-runtime/gpgkey'
default['yum']['nvidia-container-runtime']['repo_gpgcheck'] = true
default['yum']['nvidia-container-runtime']['sslcacert'] = '/etc/pki/tls/certs/ca-bundle.crt'
default['yum']['nvidia-container-runtime']['sslverify'] = true
default['yum']['nvidia-container-runtime']['description'] = 'nvidia-container-runtime'
default['yum']['nvidia-container-runtime']['enabled'] = true
default['yum']['nvidia-container-runtime']['failovermethod'] = 'priority'
default['yum']['nvidia-container-runtime']['make_cache'] = true
default['yum']['nvidia-container-runtime']['managed'] = true
default['yum']['nvidia-container-runtime']['repositoryid'] = 'nvidia-container-runtime'
