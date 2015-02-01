# Let's get coverage reporting from Codeclimate
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require "minitest/reporters"
Minitest::Reporters.use!

# Allow Codeclimate
WebMock.disable_net_connect!(:allow => "codeclimate.com")
VCR.configure do |config|
  # your existing configuration
  config.ignore_hosts 'codeclimate.com'
end

#we need the actual library file
require_relative '../lib/bus-o-matic.rb'