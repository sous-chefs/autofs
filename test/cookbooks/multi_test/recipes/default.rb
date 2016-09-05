automaster_entry '/home' do
  map '/awesome_perl_script.pl'
  options 'nfsvers=3 --timeout=600'
end

map_entry 'userhome' do
  location 'smbserver:export'
  fstype 'smb'
  map '/etc/auto.smb'
end

nfs '/nfs/userhome' do
  server 'nfsserver'
  export 'export'
  fstype 'nfs'
  map '/etc/auto.nfs'
  options 'rw,hard,intr,sync'
end
