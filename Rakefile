# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "omniauth-sharefile"
  gem.homepage = "http://github.com/backstitch/omniauth-sharefile"
  gem.license = "Proprietary"
  gem.summary = %Q{Sharefile Omniauth stratagy}
  gem.email = "admin@backstit.ch"
  gem.authors = ["backstitch Inc."]
  gem.files.exclude "spec/*"
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('lib/omniauth-sharefile/version.rb') ? File.read('lib/omniauth-sharefile/version.rb') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "omniauth-sharefile #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
