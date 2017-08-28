# frozen_string_literal: true

require 'spec_helper'
require 'shared_spec'

gem_path = '/usr/local/bin'
check_name = 'check-load.rb'
check = "#{gem_path}/#{check_name}"

describe 'ruby environment' do
  it_behaves_like 'ruby checks', check
end

describe file(check) do
  it { should be_file }
  it { should be_executable }
end

describe command(check.to_s) do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/CheckLoad OK: Per core load average \([\d+] CPU\)\: \[[\d]+.[\d]+, [\d]+.[\d]+, [\d]+.[\d]+\]/) }
end

describe command("#{check} -w 0") do
  its(:exit_status) { should eq 1 }
  its(:stdout) { should match(/CheckLoad WARNING: Per core load average \([\d+] CPU\)\: \[[\d]+.[\d]+, [\d]+.[\d]+, [\d]+.[\d]+\]/) }
end

describe command("#{check} -c 0") do
  its(:exit_status) { should eq 2 }
  its(:stdout) { should match(/CheckLoad CRITICAL: Per core load average \([\d+] CPU\)\: \[[\d]+.[\d]+, [\d]+.[\d]+, [\d]+.[\d]+\]/) }
end
