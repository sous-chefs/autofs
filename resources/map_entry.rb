resource_name :map_entry
provides :map_entry
unified_mode true
default_action :create

property :fstype, String, default: 'nfs4'
property :key, String, name_property: true
property :location, String
property :map, String, required: true
property :mount_point, String, default: lazy { '/' + map.match(/(?:\.)(.*)/).captures.first }
property :options, String

action :create do
  file new_resource.map

  # the automaster_entry may have already been created (with options)
  # so only create it if it doesn't exist
  find_resource(:automaster_entry, new_resource.mount_point) do
    map new_resource.map
  end

  opts = if !new_resource.options
           new_resource.fstype
         else
           [new_resource.fstype, new_resource.options].join(',')
         end

  service 'autofs' do
    action :nothing
  end

  replace_or_add new_resource.key do
    line "#{new_resource.key} -fstype=#{opts} #{new_resource.location}"
    path new_resource.map
    pattern "#{Regexp.escape(new_resource.key)}\s.*"
    notifies :reload, 'service[autofs]'
  end

  case new_resource.fstype
  when 'nfs4'
    if platform_family? 'debian'
      package 'nfs-common'
    else
      package 'nfs-utils'
    end
  else
    log 'NFS type not set or supported' do
      message 'NFS type not set or supported'
      level :debug
    end
  end
end
