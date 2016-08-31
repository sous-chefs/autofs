resource_name :automaster_entry
default_action :create

property :map, String, required: true
property :mount_point, String, name_property: true
property :options, String

action :create do
  package 'autofs'

  service 'autofs' do
    action [:enable, :start]
  end

  file '/etc/auto.master'

  replace_or_add mount_point do
    line "#{mount_point} #{map} #{options}"
    path '/etc/auto.master'
    pattern "#{mount_point} #{map}.*"
    notifies :reload, 'service[autofs]'
  end
end
