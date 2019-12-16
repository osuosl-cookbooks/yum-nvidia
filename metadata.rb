name             'yum-nvidia'
maintainer       'Oregon State University'
maintainer_email 'chef@osuosl.org'
license          'Apache-2.0'
chef_version     '>= 12.18' if respond_to?(:chef_version)
issues_url       'https://github.com/osuosl-cookbooks/yum-nvidia/issues'
source_url       'https://github.com/osuosl-cookbooks/yum-nvidia'
description      'Installs/Configures yum-nvidia'
long_description 'Installs/Configures yum-nvidia'
version          '1.0.0'

supports         'centos', '~> 8.0'
supports         'centos', '~> 7.0'
