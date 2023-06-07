release = os.release.to_i
arch = os.arch
platform_group = os.name == almalinux ? 'rhel' : 'centos'
libnvidia_container_url = "https://nvidia.github.io/libnvidia-container/#{platform_group}#{release}/#{arch}"
nvidia_container_runtime_url = "https://nvidia.github.io/nvidia-container-runtime/#{platform_group}#{release}/#{arch}"
nvidia_docker_url = "https://nvidia.github.io/nvidia-docker/centos#{release}/#{arch}"

describe yum.repo('cuda') do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should include "https://developer.download.nvidia.com/compute/cuda/repos/rhel#{release}/#{arch}" }
end

describe yum.repo('libnvidia-container') do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should include libnvidia_container_url }
end

describe yum.repo('nvidia-container-runtime') do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should include nvidia_container_runtime_url }
end

describe yum.repo('nvidia-docker') do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should include nvidia_docker_url }
end

nvidia_driver = release >= 8 ? 'nvidia-driver' : 'nvidia-driver-latest-dkms'

['nvidia-docker2', nvidia_driver, 'cuda'].each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end

describe command('nvidia-docker version') do
  its('stdout') { should match /NVIDIA Docker: 2+/ }
  its('exit_status') { should eq 0 }
end
