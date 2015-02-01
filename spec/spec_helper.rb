# Let's get coverage reporting from Codeclimate
WebMock.disable_net_connect!(:allow => "codeclimate.com")
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require "minitest/reporters"
Minitest::Reporters.use!

#we need the actual library file
require_relative '../lib/bus-o-matic.rb'