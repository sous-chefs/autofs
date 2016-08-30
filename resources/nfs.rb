# resource_name :nfs
#
# property :server, String
# property :export, String
# property :location, String, default: lazy { "#{server}:#{export}" }
# property :map, String, default: '/etc/auto.nfs'
# property :mount_point, String, name_property: true
# property :fstype, String, default: 'nfs4'
# property :options, [String, nil]
#
# action :create do
#   map_entry do
#     location "#{new_resource.location}"
#     key "#{new_resource.mount_point}"
#     options "#{new_resource.options}"
#     map "#{new_resource.map}"
#     fstype "#{new_resource.fstype}"
#     mount_point "#{new_resource.mount_point}"
#   end
# end
