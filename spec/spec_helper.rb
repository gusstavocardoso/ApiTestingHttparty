require 'bundler/setup'
require 'httparty'
require_relative '../lib/api_client.rb'
require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
  config.color = true
end
