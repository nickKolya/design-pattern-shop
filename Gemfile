source 'https://rubygems.org'

ruby '2.3.1'

#=== CORE =======================================
gem 'rails',             '~> 5.0.0', '>= 5.0.0.1'
gem 'pg',                               '~> 0.18'
gem 'puma',                              '~> 3.0'

gem 'trailblazer'
gem 'trailblazer-rails'
gem 'cells-haml'
gem 'cells-rails'

gem 'figaro'

#=== UI =========================================
gem 'sass-rails',                        '~> 5.0.3'
gem 'turbolinks',                        '~> 5.0'
gem 'haml',        github: 'haml/haml', ref: '7c7c169'
gem 'jquery-rails'

#=== FEATUES ====================================
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'simple_form',                       '~> 3.3'
gem 'friendly_id',                       '~> 5.1'
gem 'kaminari',                         '~> 0.17'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'paperclip',                         '~> 5.0'

#=== PAYMENTS ====================================
gem 'stripe'

#=== TEMPLATE REQUIREMENTS ====================================
gem 'bootstrap-sass', '~> 3.3.6'
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'master'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'font-awesome-rails'
gem 'jquery-ui-rails'
gem 'momentjs-rails', '~> 2.11', '>= 2.11.1'
gem 'moment_timezone-rails'
gem 'twitter-bootstrap-rails'

#=== DEV & TEST =================================
group :development do
  gem 'web-console'
  gem 'listen',                          '~> 3.0'
  gem 'spring'
  gem 'spring-watcher-listen',           '~> 2.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'bullet'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'awesome_print'
  gem 'letter_opener'
end

group :test do
  gem 'faker'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'simplecov',                 require: false
  gem 'launchy'
end
