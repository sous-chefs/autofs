require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  it { should contain '/smb /etc/auto.smb' }
end

describe file('/etc/auto.smb') do
  it { should contain 'userhome -fstype=smb smbserver:export' }
end
