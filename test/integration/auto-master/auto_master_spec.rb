describe package('autofs') do
  it { should be_installed }
end

describe service('autofs') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/auto.master') do
  its('content') { should match('/misc /etc/auto.misc') }
end
