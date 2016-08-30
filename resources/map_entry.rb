resource_name :map_entry

property :key, String, name_property: true
property :location, [ String, nil ], default: nil
property :options, [ String, nil ], default: nil
property :map, String, required: true
property :fstype, [ String, nil ], default: nil
property :mount_point, String, default: lazy {'/' + map.match(/(?:\.)(.*)/).captures.first}

action :create do
  file map

  automaster_entry mount_point do
    map "#{new_resource.map}"
  end

  if options.nil?
    opts = fstype
  else
    opts = [fstype, options].join(',')
  end

  replace_or_add key do
    path map
    pattern "#{key}.*"
    line "#{key} -fstype=#{opts} #{location}"
    notifies :reload, 'service[autofs]'
  end


  case fstype
  when 'nfs4'
    include_recipe 'chef-sugar'
    package 'nfs-utils' if rhel?
    package 'nfs-common' if debian?
  end
end
