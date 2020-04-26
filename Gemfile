source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

##########################################
# Application Structure
##########################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Simple, efficient background processing for Ruby.
#   Install info: https://github.com/mperham/sidekiq/wiki/Active+Job
gem 'sidekiq'

##########################################
# Documentation
##########################################

# Eaily view db schemas - bundle exec annotate
gem 'annotate', '~> 2.0', group: :development

##########################################
# Design, structure, and management
##########################################

# Use Sass, SCSS for stylesheets
gem 'sassc-rails'

# # mask inputs to auto format responces
# gem 'maskedinput-rails'

# # add css prefixes automatically
# gem 'autoprefixer-rails'

# add haml support for rails
gem 'haml-rails'

# A library for creating declarative interfaces in controllers
gem 'decent_exposure'

# Better Enumerations
gem 'enumerations'

# Single Service Objects
gem 'interactor'

# Decorators
gem 'draper'

# insert svg code inline
gem 'inline_svg'

# real time reactive rails application extension
gem 'stimulus_reflex'

##########################################
# Authentication
##########################################

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# devise authentication system
gem 'devise'

# pundit authorization system
gem 'pundit'

# Active Admin Administration
# gem 'activeadmin'

##########################################
# Database Uploading and Storage
##########################################

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# DB Versioning
gem 'logidze'

##########################################
# Forms
##########################################

# Simple form - a easier way to make rails forms
gem 'simple_form'
# gem 'client_side_validations' # TODO: webpacker?
# gem 'client_side_validations-simple_form' # TODO: webpacker?

# embeded form fields
# gem 'cocoon' # TODO: webpacker?

# Pagination at the model level
#gem 'kaminari'

# Remote form submission
# gem 'remotipart' # TODO: webpacker?

##########################################
# Webserver and server info
##########################################

# Server side browser detection and device info
gem 'browser'

# Error and Performance monitoring
# gem 'airbrake'
# gem 'newrelic_rpm'

# Use Puma as the app server
gem 'puma'

# Start Grouped Enviroments
##########################################
# DEVELOPMENT AND TEST

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Preview email in the default browser instead of sending it via
  gem 'letter_opener'

  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails'

  # A library for generating fake data
  gem 'faker'

  # Rspec testing library
  gem 'rspec-rails'

  # Guard live watching of html and css changes
  gem 'guard', require: false
  gem 'guard-livereload', require: false
  gem 'rack-livereload'

  # Guard Live Watching of Rspec
  gem 'guard-rspec', require: false

  # Allow multiple commands to run on the server
  gem 'foreman'

  # Better errors for rack applications
  gem 'better_errors'
  gem 'binding_of_caller'
end

# END | DEVELOPMENT AND TEST
##########################################
# DEVELOPMENT ONLY

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# END | DEVELOPMENT ONLY
##########################################
# TEST ONLY

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# END | TEST ONLY
##########################################

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
