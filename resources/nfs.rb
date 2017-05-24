resource_name :nfs
default_action :create

property :export, String
property :fstype, String, default: 'nfs4'
property :key, String, default: '/-'
property :location, String, default: lazy { "#{server}:#{export}" }
property :map, String, default: '/etc/auto.nfs'
property :mount_point, String, name_property: true
property :options, String
property :server, String

action :create do
  map_entry new_resource.mount_point do
    fstype new_resource.fstype
    location new_resource.location
    map new_resource.map
    mount_point new_resource.key
    options new_resource.options
  end
end
