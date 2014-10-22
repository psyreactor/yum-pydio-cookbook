# Encoding: utf-8
require 'spec_helper'

describe 'yum-pydio::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(
      :platform => 'centos',
      :version => '6.5'
      ) do |node|
        node.automatic['kernel']['machine'] = 'x86_64'
      end.converge('yum-pydio::default')
  end

  it 'creates yum repo pydio' do
    expect(chef_run).to create_yum_repository('pydio')
    expect(chef_run).to create_yum_repository('pydio-testing')
    expect(chef_run).to create_yum_repository('pydio-sources')
  end

end
