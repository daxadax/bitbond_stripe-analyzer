require './stripe_analyzer'
require 'rake/testtask'
require 'sinatra/activerecord/rake'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end
