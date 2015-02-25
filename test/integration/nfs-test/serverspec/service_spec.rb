# require_relative '../../../shared/spec_helper.rb'
require 'serverspec'

set :backend, :exec

describe package('nfs-utils') do
  it { should be_installed }
end

describe package('autofs') do
  it { should be_installed }
end

describe service('autofs') do
  it { should be_running }
end
