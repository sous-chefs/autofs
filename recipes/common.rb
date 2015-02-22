#
# Cookbook Name:: autofs
# Recipe:: common
#
# Copyright ModCloth, Inc.
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

service 'autofs' do
  supports [:start, :stop, :restart, :reload, :status]
  action [:enable, :start]
end

node[:autofs][:external_files].each do |filename, file_content|
  file filename.dup do
    content file_content.dup << "\n"
    owner 'root'
    group 'root'
    mode 0644
  end
end

template "#{node[:autofs][:auto_master_path]}" do
  source 'auto_master.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, resources(service: 'autofs'), :immediately
  variables(
    auto_master_entries: node[:autofs][:auto_master_entries],
    external_files: node[:autofs][:external_files]
  )
end
