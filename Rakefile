require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks :name => 'equatable'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  # t.ruby_opts = "-w"
  # t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end
