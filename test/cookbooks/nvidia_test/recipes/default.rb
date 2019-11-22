if node['kernel']['machine'] == 'ppc64le'
  node.default['yum']['docker-stable']['baseurl'] =
    'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/docker-stable/$basearch'
  node.default['yum']['docker-stable']['gpgcheck'] = true
  node.default['yum']['docker-stable']['gpgkey'] = 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl'
end

include_recipe 'chef-yum-docker'
include_recipe 'yum-epel'

package %w(nvidia-docker2 nvidia-driver-latest cuda)

service 'docker' do
  action [:start, :enable]
end
