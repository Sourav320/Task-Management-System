source "https://rubygems.org"

ruby "3.2.1"

gem "rails", "~> 7.0.8"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"

# Bootstrap + JS
gem "bootstrap", "~> 5.3"
gem "jquery-rails"
gem "sassc-rails"
gem "sprockets-rails"
gem "select2-rails"
gem 'simple_form'
gem 'will_paginate-bootstrap4'
gem "ransack"
gem 'unobtrusive_flash'







# Hotwire
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"


# Authentication
gem "devise"

# JSON APIs
gem "jbuilder"

# Performance
gem "bootsnap", require: false

# Timezone data
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
