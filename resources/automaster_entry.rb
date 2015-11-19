resource_name :automaster_entry

property :mount_point, String, name_property: true
property :map, String
property :options, String

action :create do
  package 'autofs'
  service 'autofs' do
    action [:enable, :start]
  end
  file '/etc/auto.master'

  replace_or_add mount_point do
    path '/etc/auto.master'
    pattern "#{mount_point} #{map}.*"
    line "#{mount_point} #{map} #{options}"
    notifies :reload, 'service[autofs]', :immediately
  end
end
