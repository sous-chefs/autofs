map_entry 'userhome' do
  fstype 'smb'
  location 'smbserver:export'
  map '/etc/auto.smb'
  mount_point '/smb'
end
