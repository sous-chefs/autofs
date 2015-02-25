autofs_nfs 'bucket' do
  mount_point '/bucket' 
  server 'bignfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs4'
end

include_recipe 'autofs'

autofs_nfs 'bowl' do
  mount_point '/bowl' 
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end

autofs_nfs 'churn' do
  mount_point '/churn' 
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end
