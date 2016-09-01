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
  its('content') { should match('/home /awesome_perl_script.pl nfsvers=3 --timeout=600') }
  its('content') { should match('/smb /etc/auto.smb') }
  its('content') { should match('/- /etc/auto.nfs') }
end

describe file('/etc/auto.smb') do
  its('content') { should match('userhome -fstype=smb smbserver:export') }
end

describe file('/etc/auto.nfs') do
  its('content') { should match('/nfs/userhome -fstype=nfs4,rw,hard,intr,sync nfsserver:export') }
end
