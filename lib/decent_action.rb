require 'decent_action/version'


require 'virtus'

require 'active_model'
require 'active_support/all'
require 'decent_action/configuration'
require 'decent_action/controller/wrapper'
require 'decent_action/controller/run_action'
require 'decent_action/action_wrappers/base'
require 'decent_action/as_active_model'
require 'decent_action/contract'
require 'decent_action/has_contract'
require 'decent_action/base'

module DecentAction
  # Your code goes here...

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
