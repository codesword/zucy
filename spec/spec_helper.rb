require "simplecov"
SimpleCov.start
require "codeclimate-test-reporter"
require "test_reporter_helper"
CodeClimate::TestReporter.start

require "rspec"
require "rack/test"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "todolist/config/application.rb"

ENV["RACK_ENV"] = "test"

