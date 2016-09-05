nfs '/nfs/userhome' do
  server 'nfsserver'
  export 'export'
  map '/etc/auto.nfs'
end
