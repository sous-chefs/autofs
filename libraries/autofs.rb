Chef.resource :automaster_entry do
  property :mount_point, String, identity: true
  property :map, Path, identity: true
  property :options, String

  recipe do
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
end

Chef.resource :map_entry do
  property :key, String, identity: true
  property :location, Path
  property :options, default: nil
  property :map, Path
  property :fstype, String
  property :mount_point, Path do
    default { '/' + map.match(/(?:\.)(.*)/).captures[0] }
  end
  recipe do
    file map
    automaster_entry mount_point, map do
    end
    service 'autofs'
    if options.nil?
      opts = fstype
    else
      opts = [fstype, options].join(',')
    end
    replace_or_add key do
      path map
      pattern "#{key}.*"
      line "#{key} -fstype=#{opts} #{location}"
      notifies :reload, 'service[autofs]', :immediately
    end

    case fstype
    when 'nfs4'
      include_recipe 'chef-sugar'
      package 'nfs-utils' if rhel?
      package 'nfs-common' if debian?
    end
  end
end

Chef.resource :nfs, :map_entry do
  include Chef::DSL::IncludeRecipe

  property :server, String
  property :export, Path
  property :location do
    default { "#{server}:#{export}" }
  end
  property :map do
    default '/etc/auto.nfs'
  end
  property :mount_point do
    default { '/-' }
  end
  property :fstype do
    default { 'nfs4' }
  end
end
