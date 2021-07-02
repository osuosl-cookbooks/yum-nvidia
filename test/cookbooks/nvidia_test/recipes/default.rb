# Needed for dkms
include_recipe 'yum-epel'

docker_installation_package 'default'

nvidia_driver = node['platform_version'].to_i >= 8 ? 'nvidia-driver' : 'nvidia-driver-latest-dkms'

package ['nvidia-docker2', nvidia_driver, 'cuda']

service 'docker' do
  action [:start, :enable]
end
