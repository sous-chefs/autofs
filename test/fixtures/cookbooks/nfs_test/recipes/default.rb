automaster_entry '/home', '/awesome_perl_script.pl' do
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
end
