autofs_nfs 'bucket' do
  mount_point '/bucket'
  server 'bignfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs4'
end

node.default['autofs']['auto_master_entries'] = ['/home /awesome_perl_script.pl nfsvers=3 --timeout=600']
include_recipe 'autofs'

autofs_nfs 'bowl' do
  mount_point '/bowl'
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end

autofs_nfs '/churn' do
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end
