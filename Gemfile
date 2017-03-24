# frozen_string_literal: true
source "https://rubygems.org"
ruby "2.4.0"

gem "bullet", group: :development
gem "rails"
gem "spring", group: :development

gem "grape" # REST-like API micro-framework for Ruby
gem "grape-swagger"
gem "grape-swagger-rails"
gem "hashie-forbidden_attributes" # disables the security feature of strong_params at
gem "pg" # database for Active Record
gem "puma" # Action Cable needs a threaded server
gem "redis" # in-memory data structure store
# the model layer, allowing you the use of Grape's own params
# validation instead.
gem "activeadmin", "~> 1.0.0.pre5" # it's the newest, pre-release version
gem "active_model_serializers"
gem "api-pagination"
gem "carrierwave" # file upload library for Ruby
gem "counter_culture" # turbo-charged counter caches
gem "devise" # authentication
gem "figaro" # app configuration using ENV and a single YAML file
gem "fog" # Ruby cloud services library (used in carrierwave to send images to AWS S3)
gem "geocoder"
gem "grape-active_model_serializers"
gem "http_accept_language" # extracts Accept-Language header into an array
gem "inherited_resources", "~> 1.7" # required for activeadmin gem
gem "kaminari" # pagination
gem "kaminari-grape"
gem "mini_magick" # handle picture resizing
gem "newrelic_rpm"
gem "one_signal"
gem "pundit"
gem "rack-cors", require: "rack/cors" # support for Cross-Origin Resource Sharing (CORS)
gem "uglifier"

group :development do
  gem "pry-rails" # changes rails console to 'pry'
  gem "rubocop"
end

group :development, :test do
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "faker", github: "stympy/faker"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "rspec-rails"
end

group :production do
  gem "oj"
  gem "rollbar", git: "git://github.com/rollbar/rollbar-gem.git"
end

group :test do
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem "simplecov"
end
