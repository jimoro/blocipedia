source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
 gem 'pg'
 gem 'rails_12factor'
end

group :development do
 gem 'sqlite3'
end

#gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'figaro'
gem 'pry'
#gem 'bootstrap-sass', '~> 3.3.6'
#gem 'sass-rails', '>= 3.2'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bootstrap', '~> 4.0.0.alpha6'
# Devise handles registration and login/logout
gem 'devise'
# Pundit handles authorization based on policy classes for roles
gem 'pundit'
# Stripe handles online payments
gem 'stripe'
# Redcarpet handles parsing Markdown code and presenting it as HTML (or plain text).
gem 'redcarpet'

group :development, :test do
 gem 'byebug'
 gem 'web-console', '~> 2.0'
 gem 'spring'
 gem 'rspec-rails'
 gem 'shoulda'
# Faker is used with db/seeds.rb to create semi-realistic looking sample records
 gem 'faker'
 gem 'factory_girl_rails'
end
