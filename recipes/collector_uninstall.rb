#
# Cookbook Name:: dynatrace
# Recipes:: collector_uninstall
#
# Copyright 2016, Dynatrace
#
include_recipe 'dynatrace-appmon::node_info'

unless platform_family?('debian', 'fedora', 'rhel')
  raise 'Unsupported platform family.'
end

installation_path = "#{node['dynatrace']['collector']['linux']['installer']['prefix_dir']}/dynatrace"
installer_cache_dir = "#{Chef::Config['file_cache_path']}/dynatrace"

# NOTE: this may also delete files from other Dynatrace packages that share the same directory (e.g. /opt/dynatrace)!
dynatrace_uninstall_package 'Uninstall Dynatrace Collector' do
  installation_path installation_path
  installer_cache_path installer_cache_dir
  service_name 'dynaTraceCollector'
end
