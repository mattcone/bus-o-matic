# Let's get coverage reporting from Codeclimate
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# We need the actual library file
require_relative '../lib/bus-o-matic.rb'
