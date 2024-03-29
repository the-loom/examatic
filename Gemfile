source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.4"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem "image_processing", "~> 1.12"

gem "net-smtp", require: false

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Forms
gem "simple_form", "~> 5.1"

# Templating
gem "haml-rails", "~> 2.0"

# Tags
gem "acts-as-taggable-on", "~> 9.0"

# Discarding stuff
gem "discard", "~> 1.2"

# Multitenancy
gem "request_store"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Performance asessment
  gem "bullet", "~> 6.1"
  gem "rack-mini-profiler", "~> 1.1"

  # Debugging
  gem "better_errors", "~> 2.9"
  gem "binding_of_caller"

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Best practices
  gem "rails_best_practices", "~> 1.21"
  gem "rubocop-performance", "~> 1.11", require: false
  gem "rubocop-rails_config", "~> 1.5"
  gem "rubocop-rake", "~> 0.6", require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Attachments
gem "aws-sdk-s3", "~> 1.96"

# OAuth
gem "omniauth-github", "~> 1.4"
