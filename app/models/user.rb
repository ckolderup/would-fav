class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name

  has_many :privileges
  has_many :collections, through: :privileges

  validates_uniqueness_of :name

  before_create :generate_default_collection

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.access_token = auth["credentials"]["token"]
      user.access_token_secret = auth["credentials"]["secret"]
    end
  end

  private

  def generate_default_collection
    collection = Collection.create("#{self.user.name}'s Favorites")
    Privilege.create(user: self, collection: collection, level: :owner)
  end
end
