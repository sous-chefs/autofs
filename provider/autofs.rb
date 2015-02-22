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
property :export_name, String, identity = true
property :server_name, String
property :mount_options, String
property :source, String

sevice 'autofs' do
  supports [:start, :stop, :status, :reload]
  action [:enable, :start]
end

#  put files on disk
# with a hash of each export

# export_name e.g. /nfs, /psreports
export_name

#  server_name e.g. awesome-nfs-server.home
server_name

#  mount_options e.g. -fstype=ext2
# for more examples see: http://man7.org/linux/man-pages/man5/autofs.5.html
mount_options

# source_file
# puts a file with the contents of above in /etc/auto.X where X is source files
# name
# This defaults to auto.nfs
source_file
