#!/usr/bin/env rake

require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"

Rake::ExtensionTask.new("winsize") do |task|
  task.ext_dir = "ext"
end

Rake::TestTask.new do |task|
  task.libs << "test"
  task.test_files = Dir["test/**/*_test.rb"]
  task.verbose = true
end

task :test => :compile
