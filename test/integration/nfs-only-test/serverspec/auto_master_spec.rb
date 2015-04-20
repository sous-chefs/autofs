require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  it { should contain '/- /etc/auto.nfs' }
end

describe file('/etc/auto.nfs') do
  it { should contain '/nfs/userhome -fstype=nfs4 nfsserver:export' }
end
