class Identity < ApplicationRecord
  belongs_to :user

  def self.by_omniauth(auth)
    identity = find_by(provider: auth["provider"], uid: auth["uid"]) || create_with_omniauth(auth)
    identity.user = find_corresponding_user(identity) if identity.user == nil
    identity.update_attribute(:name, auth["info"]["name"])
    identity
  end

  private
  def self.create_with_omniauth(auth)
    create! do |identity|
      identity.provider = auth["provider"]
      identity.uid = auth["uid"]
      identity.name = auth["info"]["name"]
      identity.email = auth["info"]["email"]
      identity.user = User.create(name: identity.name)
    end
  end
end
