#
# Cookbook Name:: autofs
# Resource:: nfs 
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

recipe do
  node.set['autofs']['mounts']['nfs'][:mount_point]['server'] = server
  node.set['autofs']['mounts']['nfs'][:mount_point]['export'] = export
  node.set['autofs']['mounts']['nfs'][:mount_point]['mount_options'] = mount_options

  template '/etc/auto.nfs' do
    source 'auto.nfs.erb'
    mode '0644'
    owner 'root'
    variables mounts: node['autofs']['mounts']['nfs']
    cookbook 'autofs'
  end
end
