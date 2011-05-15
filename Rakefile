require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
task :default => :test

desc 'Run tests (default)'
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/**/*_test.rb']
  t.ruby_opts = ['-Itest']
  t.libs << "lib" << "test"
  t.ruby_opts << '-rubygems' if defined? Gem
end

if ENV['RAILS_ENV']=='development' # yard gem is only in development
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb']
    #t.options = ['--one-file']
  end
end

namespace :docs do
  desc 'Generate documentation for the appliaction with Yard'
  task :yard do
    system("yardoc 'lib/**/*.rb' - README.md")
  end
end

