require 'rubygems'
require 'bundler/setup'

# Immediately snc all stdout/stderr
$stdout.sync = true
$stderr.sync = true

# Change to the directory of this file
Dir.chdir(File.expand_path("../",__FILE__))
# Gemhelper
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
Rspec::Core::RakeTask.new

task :default => :spec
