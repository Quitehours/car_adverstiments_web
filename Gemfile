source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> #{File.read('.ruby-version').strip}"

gem 'rails', '~> 7.0'

gem 'bootsnap', '~> 1.10', require: false
gem 'bootstrap', '~> 5.0'
gem 'devise', '~> 4.8'
gem 'ffaker', '~> 2.20'
gem 'hamlit', '~> 2.15'
gem 'importmap-rails', '~> 1.0'
gem 'kaminari', '~> 1.2'
gem 'pg', '~> 1.3.0'
gem 'puma', '~> 5.0'
gem 'sass-rails', '~> 6.0'
gem 'sprockets-rails', '~> 3.4'
gem 'turbo-rails', '~> 1.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bundler-audit', '~> 0.9.0.1'
  gem 'bundler-leak', '~> 0.2.0'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'fasterer', '~> 0.1.9'
  gem 'lefthook', '~> 0.7.7'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rspec-rails', '~> 5.1'
  gem 'rubocop', '~> 1.22.0', require: false
  gem 'rubocop-performance', '~> 1.11'
  gem 'rubocop-rails', '~> 2.13'
  gem 'rubocop-rake', '~> 0.6.0'
  gem 'rubocop-rspec', '~> 2.8'
  gem 'solargraph', '~> 0.44.2'
  gem 'strong_migrations', '~> 0.7.9'
  gem 'traceroute', '~> 0.8'
end
group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.12.0', require: false
end
