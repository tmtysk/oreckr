#
# Cookbook Name:: railsapp
# Recipe:: default
#
# Copyright 2013, tmtysk
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

%w{libxml2-dev libxslt-dev libsqlite3-dev sqlite3 libmagickcore-dev libmagickwand-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

rbenv_ruby "2.0.0-p0"

rbenv_gem "bundler" do
  ruby_version "2.0.0-p0"
end

