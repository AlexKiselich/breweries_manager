class Beer < ApplicationRecord
  belongs_to :brewery

  def self.only_true
    Beer.where(on_draft: :true)
  end
end