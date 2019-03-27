yum-nvidia Cookbook
===================

NVIDIA yum repositories used for CUDA or nvidia-docker. This cookbook allows attribute manipulation of ``cuda``,
``libnvidia-container``, ``nvidia-container-runtime``, and ``nvidia-docker`` repositories.

Requirements
------------

## Platforms

- RHEL/CentOS and derivatives

## Chef

- Chef 13.8+

## Cookbooks

- none

Attributes
----------

The following attributes are set by default

```ruby
default['yum-nvidia']['repos'] = %w(
  cuda
  libnvidia-container
  nvidia-container-runtime
  nvidia-docker
)
```

Check each individual repository attribute file for their default settings.

Usage
-----
#### yum-nvidia::default

Point the NVIDIA repositories at an internally hosted server.

```ruby
node.default['yum']['cuda']['enabled'] = true
node.default['yum']['cuda']['mirrorlist'] = nil
node.default['yum']['cuda']['baseurl'] = 'https://internal.example.com/centos/7/os/x86_64'
node.default['yum']['cuda']['sslverify'] = false

include_recipe 'yum-nvidia'
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `username/add_component_x`)
3. Write tests for your change
4. Write your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Oregon State University <chef@osuosl.org>

```text
Copyright:: 2019, Oregon State University

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
