if node['kernel']['machine'] == 'ppc64le'
  node.default['yum']['docker-stable']['baseurl'] =
    'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/docker-stable/$basearch'
  node.default['yum']['docker-stable']['gpgcheck'] = true
  node.default['yum']['docker-stable']['gpgkey'] = 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl'
end

if node['platform_version'].to_i >= 8
  yum_repository 'Docker' do
    baseurl 'https://download.docker.com/linux/centos/7/x86_64/stable'
    gpgkey 'https://download.docker.com/linux/centos/gpg'
    description 'Docker Stable repository'
    gpgcheck true
    enabled true
    # Enable all rpms to workaround modularity issue:
    # https://forums.docker.com/t/yum-repo-for-centos-8/81884/8
    options(module_hotfixes: true)
  end
else
  include_recipe 'chef-yum-docker'
end
include_recipe 'yum-epel'

nvidia_driver = node['platform_version'].to_i >= 8 ? 'nvidia-driver' : 'nvidia-driver-latest-dkms'

package ['nvidia-docker2', nvidia_driver, 'cuda']

service 'docker' do
  action [:start, :enable]
end
