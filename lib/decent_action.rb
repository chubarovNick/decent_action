# frozen_string_literal: true

require 'decent_action/version'

require 'virtus'

require 'active_model'

require 'active_support/all'
require 'decent_action/configuration'
require 'decent_action/exception/invalid_error'
require 'decent_action/exception/permission_check_error'

require 'decent_action/context'
require 'decent_action/authorization/dsl'

require 'decent_action/contract/dsl'
require 'decent_action/contract/has_object'
require 'decent_action/contract/has_collection'
require 'decent_action/contract/validation'
require 'decent_action/contract/active_model'
require 'decent_action/contract/errors'
require 'decent_action/contract/base'
require 'decent_action/contract/build'

require 'decent_action/action_wrappers/base'
require 'decent_action/action_wrappers/exception'
require 'decent_action/action_wrappers/validation'
require 'decent_action/controller/wrapper'
require 'decent_action/controller/run_action'

require 'decent_action/action_wrappers/base'
require 'decent_action/base'

# Main module for configuration
module DecentAction
  class << self
    attr_reader :config

    def reset_config
      @config = DecentAction::Configuration.new
    end

    def config
      @config ||= DecentAction::Configuration.new
    end

    def configure
      yield config
    end
  end
end
