class Collection < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: [:slugged, :history]

  has_many :privileges
  has_many :users, through: :privileges

  validates_uniqueness_of :slug

  has_many :tweets

  def public?
    !private?
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def visible_to? user
    if public?
      true
    elsif user.blank?
      false
    else
      privileges.where(user: user).any?
    end
  end
end
