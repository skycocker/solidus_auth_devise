source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus_devise_token_auth', github: 'skycocker/solidus_devise_token_auth', branch: branch

group :test do
  if branch == 'master' || branch >= "v2.0"
    gem "rails-controller-testing"
  else
    gem "rails_test_params_backport"
  end
  if branch < "v2.5"
    gem 'factory_bot', '4.10.0'
  else
    gem 'factory_bot', '> 4.10.0'
  end
end

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  gem "pry-rails"
end

gem 'deface', require: false

gemspec
