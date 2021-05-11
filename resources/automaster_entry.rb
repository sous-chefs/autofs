resource_name :automaster_entry
provides :automaster_entry
unified_mode true
default_action :create

property :map, String, required: true
property :mount_point, String, name_property: true
property :options, String

action :create do
  package 'autofs'

  service 'autofs' do
    action %i(enable start)
  end

  file '/etc/auto.master'

  replace_or_add new_resource.mount_point do
    line "#{new_resource.mount_point} #{new_resource.map} #{new_resource.options}".strip
    path '/etc/auto.master'
    pattern "#{Regexp.escape(new_resource.mount_point)} #{Regexp.escape(new_resource.map)}(\s.*|$)"
    notifies :reload, 'service[autofs]'
  end
end
