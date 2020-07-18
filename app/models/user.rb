class User < ApplicationRecord
  has_many :identities

  validates_presence_of :name

  def toggle_enabled!
    self.enabled = !self.enabled
    save!
  end
end
