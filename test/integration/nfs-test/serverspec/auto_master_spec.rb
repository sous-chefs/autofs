require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  it { should contain '/- /etc/auto.nfs' }
  it { should contain '/smb /etc/auto.smb' }
  it { should contain '/home /awesome_perl_script.pl nfsvers=3 --timeout=600' }
end

describe file('/etc/auto.smb') do
  it { should contain 'userhome -fstype=smb smbserver:export' }
end
describe file('/etc/auto.nfs') do
  it { should contain '/nfs/userhome -fstype=nfs4 nfsserver:export' }
end
