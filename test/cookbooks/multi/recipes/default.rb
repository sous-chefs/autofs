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

# Work around for the kitchen Verifier requiring TTY for sudo
execute 'Set !require tty for kitchen user' do
   action :run
   command 'echo "Defaults!ALL !requiretty" >> /etc/sudoers.d/kitchen'
   not_if 'grep "Defaults!ALL !requiretty" /etc/sudoers.d/kitchen'
 end
