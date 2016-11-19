# frozen_string_literal: true
class ControllerStub
  include DecentAction::Controller::RunAction

  def action
    run StubAction, params, &:result
  end

  def validation_error_handler
    'error_handled'
  end
end
