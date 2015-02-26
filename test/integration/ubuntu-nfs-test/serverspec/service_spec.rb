# require_relative '../../../shared/spec_helper.rb'
require 'serverspec'

set :backend, :exec

describe package('nfs-common') do
  it { should be_installed }
end

describe package('autofs') do
  it { should be_installed }
end

describe service('autofs') do
  it { should be_running }
end

describe file('/bucket') do
  it { should be_directory }
end

describe file('/churn') do
  it { should be_directory }
end

describe file('/bowl') do
  it { should be_directory }
end
