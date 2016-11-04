class StubAction < DecentAction::Base
  contract do
    attribute :title, String
    validates :title, presence: true

    object :user do
      attribute :name, String
      validates :name, presence: true
    end

  end

  def perform
    "Awesome #{contract.title}"
  end

end

