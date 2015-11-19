map_entry 'userhome' do
  location 'smbserver:export'
  fstype 'smb'
  map '/etc/auto.smb'
  mount_point '/smb'
end
