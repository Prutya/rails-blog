ruby '2.4.0'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',              '5.0.1'
gem 'puma',               '3.6.0'
gem 'pg',                 '0.19'
gem 'devise',             '4.2.0'
gem 'cancancan',          '1.16.0'
gem 'sass-rails',         '5.0.6'
gem 'jquery-rails',       '4.2.2'
gem 'rails_admin',        '1.0.0'
gem 'uglifier',           '3.0.2'
gem 'jbuilder',           '2.6.0'
gem 'cloudinary',         '1.5.2'
gem 'carrierwave',        '1.0.0'

group :development, :test do
  gem 'byebug',             platform: :mri
  gem 'factory_girl',       '4.7.0'
  gem 'factory_girl_rails', '4.7.0'
  gem 'shoulda-matchers',   '3.1.1'
  gem 'rspec-rails',        '3.5.0'
end

group :development do
  gem 'web-console'
  gem 'listen',                '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
