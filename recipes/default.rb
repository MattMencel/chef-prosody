#
# Cookbook Name:: prosody
# Recipe:: package
#
# Copyright 2013, Greg Fitzgerald
# Copyright 2012, computerlyrik
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

include_recipe "prosody::#{node['prosody']['install_tpye']}"


prosody_vhost node['domain'] do
  admins: ["admin@#{node['domain']}"]
  modules_enabled: %w[dialback roster saslauth]
  enabled true
end

prosody_user 'admin' do
  password 'p4ssw0rd'
  vhosts [node['domain']]
end
