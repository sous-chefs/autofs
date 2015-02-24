
autofs_nfs 'bucket' do
  mount_point '/bucket' 
  server 'bignfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs4'
end

autofs_nfs 'bowl' do
  mount_point '/bowl' 
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end

defaults :ps_nfs, :autofs_nfs, server: 'peoplesoft.nfs', export: '/ps', mount_options: '-fstype=nfs4'

ps_nfs '/data'
ps_nfs '/reports'
