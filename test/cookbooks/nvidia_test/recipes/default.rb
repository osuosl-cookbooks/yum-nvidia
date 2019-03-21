include_recipe 'chef-yum-docker'
include_recipe 'yum-epel'

package %w(nvidia-docker2 nvidia-driver cuda)
