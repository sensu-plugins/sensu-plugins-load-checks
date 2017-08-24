# frozen_string_literal: true

require 'spec_helper'
require 'shared_spec'

gem_path = '/usr/local/bin'
check_name = 'metrics-load.rb'
check = "#{gem_path}/#{check_name}"

describe 'ruby environment' do
  it_behaves_like 'ruby checks', check
end

describe file(check) do
  it { should be_file }
  it { should be_executable }
end

describe command("#{check}") do
      its(:exit_status) { should eq 0 }
      its(:stdout) { should match /[\w]+.load_avg.one [\d+].[\d]+ [\d]+\n[\w]+.load_avg.five [\d+].[\d]+ [\d]+\n[\w]+.load_avg.fifteen [\d+].[\d]+ [\d]+\n/ }
end
