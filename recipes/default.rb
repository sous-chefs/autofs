
template '/etc/auto.nfs' do
  source 'auto.nfs.erb'
  mode '0644'
  owner 'root'
  action :nothing
end

accumulator 'autofs' do
  target template:  '/etc/auto.nfs'
  filter { |res| res.is_a? Chef::Resource::AutofsNfs }
  transform do|resources|
    mounts = {}
    resources.each do |r|
      mounts.merge!(r.mount_point =>
                    {
                      server: r.server,
                      export: r.export,
                      mount_options: r.mount_options
                    })
    end
    mounts
  end
end

# TODO: just get test working
template '/etc/auto.master' do
  source 'auto_master.erb'
  mode '0644'
  owner 'root'
  owner 'root'
  variables(
    files: ['/etc/auto.nfs'],
    entries: node['autofs']['auto_master_entries']
  )
  action :create
end

include_recipe 'chef-sugar'

package 'autofs'
# Red Hat specific
package 'nfs-utils' if rhel?
package 'nfs-common' if debian?

service 'autofs' do
  action [:enable, :start]
end
