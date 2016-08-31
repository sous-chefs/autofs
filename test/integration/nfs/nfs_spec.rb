describe package('autofs') do
  it { should be_installed }
end

describe service('autofs') do
  it { should be_enabled }
  it { should be_running }
end

case os[:family]
when 'amazon', 'centos', 'oracle', 'redhat', 'scientific'
  describe package('nfs-utils') do
    it { should be_installed }
  end
when 'debian', 'ubuntu'
  describe package('nfs-common') do
    it { should be_installed }
  end
end

describe file('/etc/auto.master') do
  its('content') { should match('/- /etc/auto.nfs') }
end

describe file('/etc/auto.nfs') do
  its('content') { should match('/nfs/userhome -fstype=nfs4 nfsserver:export') }
end
