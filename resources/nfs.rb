property :server, String
property :export, Path
# property :location, default: "#{server}:#{export}"
property :map, default: '/etc/auto.nfs'
property :mount_point, default: '/-'
property :fstype, default: 'nfs4'
