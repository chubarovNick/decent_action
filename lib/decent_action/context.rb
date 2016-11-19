# frozen_string_literal: true
require 'active_support/core_ext/module/delegation'

module DecentAction
  # Contex of action execution
  class Context
    attr_reader :action
    attr_reader :action_scope

    delegate :need_authorization?, to: :action

    def initialize(action_class, action_scope, params = {})
      @action_class = action_class
      @action = action_class.new(params)
      @action_scope = action_scope
    end

    def run
      authorize
      @action.run
    end

    private

    def authorize
      raise DecentAction::Exception::PermissionCheckError unless authorized?
    end

    def authorized?
      return true unless need_authorization?
      actor_method = DecentAction.config.actor
      actor = actor_method ? action_scope.send(actor_method) : nil
      @action_class.auth_block.call(actor)
    end
  end
end
