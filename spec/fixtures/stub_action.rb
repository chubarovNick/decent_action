class StubAction < DecentAction::Base
  contract do
    attribute :title, String
    validates :title, presence: true
  end

  def perform
    "Awesome #{contract.title}"
  end

end

