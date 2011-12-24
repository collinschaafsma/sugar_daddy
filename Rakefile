require "bundler/gem_tasks"

require 'rspec/core/rake_task'
desc "Run specs."
RSpec::Core::RakeTask.new

task :default => :spec

task :console do
  sh "irb -rubygems -I lib -r sugar_daddy.rb"
end
