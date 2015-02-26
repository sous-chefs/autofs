require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  it { should contain '/etc/auto.nfs' }
end
