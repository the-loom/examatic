class User < ApplicationRecord
  has_many :identities
  has_many :memberships
  has_many :subjects, through: :memberships

  validates_presence_of :name

  def toggle_enabled!
    self.enabled = !self.enabled
    save!
  end
end
