class ControllerStub
  include DecentAction::Controller::RunAction

  def action
    run StubAction, params do |interaction|
      interaction.result
    end
  end

  def validation_error_handler
    'error_handled'
  end
end

