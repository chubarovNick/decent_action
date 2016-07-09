module DecentAction
  class Context
    attr_reader :action
    attr_reader :action_scope

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
      raise DecentAction::Exception::PermissionCheckError if @action.need_authorization? && !@action_class.auth_block.call(actor)
    end

    def actor
      actor = DecentAction.config.actor
      actor ? action_scope.send(actor) : nil
    end

  end
end

