$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'decent_action'
require 'fixtures/controller_stub'
require 'fixtures/stub_action'

