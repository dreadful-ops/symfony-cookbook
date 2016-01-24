package "acl" do
    action :install
end

node[:symfony][:sites].each do |name, attributes|
    # Merge shared attributes with site
    attributes = Chef::Mixin::DeepMerge.hash_only_merge(node[:symfony][:shared], attributes)

    puts attributes.inspect

    # Basic capifony/capistrano layout
    [
        "#{attributes[:directory]}/#{name}",
        "#{attributes[:directory]}/#{name}/current",
        "#{attributes[:directory]}/#{name}/releases",
    ].each do |folder|
        directory folder do
          owner attributes[:user]
          group attributes[:group]
          mode "775"
          recursive true
          action :create
        end
    end

    # App Directories
    attributes[:app_directories].each do |folder|
        directory "#{attributes[:directory]}/#{name}/shared/#{attributes[:app_name]}/#{folder}" do
          owner attributes[:user]
          group attributes[:group]
          mode "775"
          recursive true
          action :create
        end
    end


    # Shared Directories
    attributes[:directories].each do |folder|
        directory "#{attributes[:directory]}/#{name}/shared/#{folder}" do
          owner attributes[:user]
          group attributes[:group]
          mode "775"
          recursive true
          action :create
        end
    end
end