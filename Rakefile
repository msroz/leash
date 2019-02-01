require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'

Rake.add_rakelib 'rakelib/**/*'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

task default: :test
task spec: :test
