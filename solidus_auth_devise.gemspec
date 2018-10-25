# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_auth_devise_devise_token_auth'
  s.version     = '2.1.0'
  s.summary     = 'Provides authentication and authorization services for use with Solidus by using Devise and CanCan (devise_token_auth revised version)'
  s.description = s.summary

  s.author       = 'Michał Siwek (skycocker)'
  s.email        = 'mike21@aol.pl'

  s.required_ruby_version = '>= 2.1'
  s.license     = %q{BSD-3}

  s.files        = `git ls-files`.split($\)
  s.test_files   = `git ls-files -- spec/*`.split($\)
  s.require_path = 'lib'
  s.requirements << 'none'

  solidus_version = ['>= 1.2.0', '< 3']

  s.add_dependency 'solidus_core_devise_token_auth', solidus_version
  s.add_dependency 'solidus_support_devise_token_auth', '>= 0.1.3'
  s.add_dependency 'devise', '~> 4.1'
  s.add_dependency 'devise-encryptable', '0.2.0'

  s.add_development_dependency 'capybara', '~> 2.14'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner', '~> 1.6'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'poltergeist', '~> 1.5'
  s.add_development_dependency 'rspec-rails', '~> 3.3'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'simplecov', '~> 0.14'
  s.add_development_dependency 'solidus_backend_devise_token_auth',  solidus_version
  s.add_development_dependency 'solidus_frontend_devise_token_auth', solidus_version
  s.add_development_dependency 'sqlite3'
end
