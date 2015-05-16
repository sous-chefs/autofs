require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  it { should contain '/misc /etc/auto.misc' }
end
