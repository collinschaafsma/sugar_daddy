require 'rubygems'
require 'bundler'
Bundler.setup :default, :test

require 'rspec'
require 'rack/test'

require 'sugar_daddy'

require "support/#{ENV["MODEL_ADAPTER"] || 'active_record'}"
require "support/helpers"

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Helpers
end
