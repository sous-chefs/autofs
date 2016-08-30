resource_name :automaster_entry

property :mount_point, String, name_property: true
property :map, String, required: true
property :options, [ String, nil ], default: nil

action :create do
  package 'autofs'

  unless resource_exists["service[autofs]"]
    service 'autofs' do
      action [:enable, :start]
    end
  end

  file '/etc/auto.master'

  replace_or_add mount_point do
    path '/etc/auto.master'
    pattern "#{mount_point} #{map}.*"
    line "#{mount_point} #{map} #{options}"
    notifies :reload, 'service[autofs]', :delayed
  end
end
