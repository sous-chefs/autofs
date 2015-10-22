property :key, String, name_property: true
property :location, Path
property :options, default: nil
property :map, Path
property :fstype, String
# property :mount_point, Path, default: '/' + map.match(/(?:\.)(.*)/).captures[0]

action :create do
  file map
  automaster_entry mount_point do
    map
  end
  service 'autofs'
  if options.nil?
    opts = fstype
  else
    opts = [fstype, options].join(',')
  end
  replace_or_add key do
    path map
    pattern "#{key}.*"
    line "#{key} -fstype=#{opts} #{location}"
    notifies :reload, 'service[autofs]', :immediately
  end

  case fstype
  when 'nfs4'
    include_recipe 'chef-sugar'
    package 'nfs-utils' if rhel?
    package 'nfs-common' if debian?
  end
end
