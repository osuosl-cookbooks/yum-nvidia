# # encoding: utf-8

# Inspec test for recipe yum-nvidia::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
if os.arch == 'ppc64le'
  libnvidia_container_url = 'https://ftp.osuosl.org/pub/osl/repos/yum/7/libnvidia-container/ppc64le'
  nvidia_container_runtime_url = 'https://ftp.osuosl.org/pub/osl/repos/yum/7/nvidia-container-runtime/ppc64le'
  nvidia_docker_url = 'https://ftp.osuosl.org/pub/osl/repos/yum/7/nvidia-docker/ppc64le'
else
  libnvidia_container_url = 'https://nvidia.github.io/libnvidia-container/centos7/x86_64'
  nvidia_container_runtime_url = 'https://nvidia.github.io/nvidia-container-runtime/centos7/x86_64'
  nvidia_docker_url = 'https://nvidia.github.io/nvidia-docker/centos7/x86_64'
end
describe yum.repo('cuda') do
  it { should exist }
  it { should be_enabled }
  its('baseurl') { should include "https://developer.download.nvidia.com/compute/cuda/repos/rhel7/#{os.arch}" }
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

%w(nvidia-docker2 nvidia-driver-latest cuda).each do |p|
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
