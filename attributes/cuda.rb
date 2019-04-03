default['yum']['cuda']['baseurl'] =
  'https://developer.download.nvidia.com/compute/cuda/repos/rhel$releasever/$basearch'
default['yum']['cuda']['description'] = 'cuda'
default['yum']['cuda']['enabled'] = true
default['yum']['cuda']['gpgcheck'] = true
default['yum']['cuda']['gpgkey'] =
  "https://developer.download.nvidia.com/compute/cuda/repos/rhel#{node['platform_version'].to_i}/#{node['kernel']['machine']}/7fa2af80.pub"
default['yum']['cuda']['make_cache'] = true
default['yum']['cuda']['managed'] = true
default['yum']['cuda']['repositoryid'] = 'cuda'
