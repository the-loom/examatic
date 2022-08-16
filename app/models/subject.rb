class Subject < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true, uniqueness: true

  def self.current
    RequestStore.store[:current_subject]
  end

  def self.current=(subject)
    RequestStore.store[:current_subject] = subject
  end
end