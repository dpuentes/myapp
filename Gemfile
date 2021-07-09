source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'bcrypt', '3.1.13'
gem 'faker', '~> 2.15', '>= 2.15.1'
gem 'will_paginate', '~> 3.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
# Use Puma as the app server
gem 'puma', '4.3.5'
gem 'sass-rails', '6.0.0'
gem 'webpacker', '4.2.2'
gem 'turbolinks', '5.2.1'
gem 'jbuilder', '2.10.0'
gem 'bootsnap', '1.4.6', require: false
gem 'sendgrid-ruby'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# Access an interactive console on exception pages or by calling 'console' anywhere in the code.
group :development do
  gem 'web-console', '4.0.2'
  gem 'listen', '3.2.1'
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end


group :test do
  gem 'capybara', '3.32.2'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers', '4.3.0'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.3.8'
  gem 'guard', '2.16.2'
  gem 'guard-minitest', '2.4.6'
  #gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
