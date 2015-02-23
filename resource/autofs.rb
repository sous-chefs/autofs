#
# Cookbook Name:: autofs
# Provider:: default
#
# Copyright (C) 2015 University of Derby
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
property :mount_point, Path, identity:  true
property :server, String
property :export, Path 
property :mount_options, String

# Auto.master
# property :autofs_files, String do
#   default { '/etc/auto.nfs' }
# end


recipe do
  # platform detection up here
  if platform_family?('solaris2', 'smartos')
    automaster = '/etc/auto_master'
  else 
    automaster = '/etc/auto.master'
  end

  # service management
  sevice 'autofs' do
    supports [:start, :stop, :status, :reload]
    action [:enable, :start]
  end

  template '/etc/auto.nfs' do
    source 'auto.nfs.erb'
    mode '0644'
    owner 'root'
    mode 'root'
    variables(
      mounts: node['autofs']['mounts']['nfs']
    ) 
  end

#  template automaster do
#    source 'auto.master.erb'
#    mode '0644'
#    owner 'root'
#    group 'root'
#    variables(
#      autofs_files: autofs_files
#    )
#  end
end 

