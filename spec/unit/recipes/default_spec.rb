require_relative '../../spec_helper'

describe 'yum-nvidia::default' do
  ALL_PLATFORMS.each do |p|
    context "#{p[:platform]} #{p[:version]}" do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(p).converge(described_recipe)
      end
      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end
      it do
        expect(chef_run).to create_yum_repository('cuda')
          .with(
            baseurl: 'https://developer.download.nvidia.com/compute/cuda/repos/rhel$releasever/$basearch',
            description: 'cuda',
            enabled: true,
            gpgcheck: true,
            gpgkey: 'https://developer.download.nvidia.com/compute/cuda/repos/rhel$releasever/x86_64/7fa2af80.pub',
            make_cache: true,
            repositoryid: 'cuda'
          )
      end
      it do
        expect(chef_run).to create_yum_repository('libnvidia-container')
          .with(
            baseurl: 'https://nvidia.github.io/libnvidia-container/centos$releasever/$basearch',
            description: 'libnvidia-container',
            enabled: true,
            failovermethod: 'priority',
            gpgcheck: false,
            gpgkey: 'https://nvidia.github.io/libnvidia-container/gpgkey',
            make_cache: true,
            repo_gpgcheck: true,
            repositoryid: 'libnvidia-container',
            sslcacert: '/etc/pki/tls/certs/ca-bundle.crt',
            sslverify: true
          )
      end
      it do
        expect(chef_run).to create_yum_repository('nvidia-container-runtime')
          .with(
            baseurl: 'https://nvidia.github.io/nvidia-container-runtime/centos$releasever/$basearch',
            description: 'nvidia-container-runtime',
            enabled: true,
            failovermethod: 'priority',
            gpgcheck: false,
            gpgkey: 'https://nvidia.github.io/nvidia-container-runtime/gpgkey',
            make_cache: true,
            repo_gpgcheck: true,
            repositoryid: 'nvidia-container-runtime',
            sslcacert: '/etc/pki/tls/certs/ca-bundle.crt',
            sslverify: true
          )
      end
      it do
        expect(chef_run).to create_yum_repository('nvidia-docker')
          .with(
            baseurl: 'https://nvidia.github.io/nvidia-docker/centos$releasever/$basearch',
            description: 'nvidia-docker',
            enabled: true,
            failovermethod: 'priority',
            gpgcheck: false,
            gpgkey: 'https://nvidia.github.io/nvidia-docker/gpgkey',
            make_cache: true,
            repo_gpgcheck: true,
            repositoryid: 'nvidia-docker',
            sslcacert: '/etc/pki/tls/certs/ca-bundle.crt',
            sslverify: true
          )
      end
    end
  end
end
