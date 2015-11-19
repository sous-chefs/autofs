nfs '/nfs/userhome' do
  server 'nfsserver'
  export 'export'
  mount_point '/nfs/userhome'
  map '/etc/auto.nfs'
end
