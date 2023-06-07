default['yum']['nvidia-docker']['baseurl'] = if platform('almalinux')
                                               'https://nvidia.github.io/nvidia-docker/rhel$releasever/$basearch'
                                             else
                                               'https://nvidia.github.io/nvidia-docker/centos$releasever/$basearch'
                                             end
default['yum']['nvidia-docker']['gpgcheck'] = false
default['yum']['nvidia-docker']['gpgkey'] = 'https://nvidia.github.io/nvidia-docker/gpgkey'
default['yum']['nvidia-docker']['repo_gpgcheck'] = true
default['yum']['nvidia-docker']['sslcacert'] = '/etc/pki/tls/certs/ca-bundle.crt'
default['yum']['nvidia-docker']['sslverify'] = true
default['yum']['nvidia-docker']['description'] = 'nvidia-docker'
default['yum']['nvidia-docker']['enabled'] = true
default['yum']['nvidia-docker']['failovermethod'] = 'priority'
default['yum']['nvidia-docker']['make_cache'] = true
default['yum']['nvidia-docker']['managed'] = true
default['yum']['nvidia-docker']['repositoryid'] = 'nvidia-docker'
