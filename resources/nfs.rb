resource_name :nfs

property :server, String
property :export, String
property :location, String, default: lazy { "#{server}:#{export}" }
property :map, String, default: '/etc/auto.nfs'
property :mount_point, String, name_property: true
property :fstype, String, default: 'nfs4'
property :options, [String, nil]

action :create do
  map_entry mount_point do
    location "#{location}"
    options "#{options}"
    map "#{map}"
    fstype "#{fstype}"
    mount_point "#{mount_point}"
  end
end
