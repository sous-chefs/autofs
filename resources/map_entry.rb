resource_name :map_entry
default_action :create

property :fstype, String
property :key, String, name_property: true
property :location, String
property :map, String, required: true
property :mount_point, String, default: lazy { '/' + map.match(/(?:\.)(.*)/).captures.first }
property :options, String

action :create do # rubocop:disable Metrics/BlockLength
  file map

  automaster_entry mount_point do
    map new_resource.map
  end

  opts = if options.nil?
           fstype
         else
           [fstype, options].join(',')
         end

  service 'autofs' do
    action :nothing
  end

  replace_or_add key do
    line "#{key} -fstype=#{opts} #{location}"
    path map
    pattern "#{key}.*"
    notifies :reload, 'service[autofs]'
  end

  case fstype
  when 'nfs4'
    include_recipe 'chef-sugar'
    debian? ? (package 'nfs-common') : (package 'nfs-utils')
  else
    log 'NFS type not set or supported' do
      message 'NFS type not set or supported'
      level :debug
    end
  end
end
