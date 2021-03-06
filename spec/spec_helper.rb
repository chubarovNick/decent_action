# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'decent_action'
require 'fixtures/controller_stub'
require 'fixtures/stub_action'
