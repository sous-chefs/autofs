require 'serverspec'

set :backend, :exec

describe file('/etc/auto.master') do
  context 'when nfs resource is used' do
    it { should contain '/etc/auto.nfs' }
  end
  context 'when putting entries into auto.master' do
    it { should contain '/home /awesome_perl_script.pl nfsvers=3 --timeout=600' }
  end
end
