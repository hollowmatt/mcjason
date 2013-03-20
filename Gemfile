source 'https://rubygems.org'
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem "rspec-rails", ">= 2.12.2"
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'pry'
end

group :development do
  gem "html2haml", ">= 1.0.1"
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
  gem "better_errors", ">= 0.7.2"
  gem "quiet_assets", ">= 1.0.2"
end

group :test do
  gem "capybara", ">= 2.0.2"
  gem "email_spec", ">= 1.4.0"
end

gem 'jquery-rails'
gem "haml-rails", ">= 0.4"
gem "bootstrap-sass", ">= 2.3.0.0"
gem "figaro", ">= 0.6.3"
