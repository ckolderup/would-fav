class Collection < ActiveRecord::Base
  has_many :privileges
  has_many :users, through: :privileges

  has_many :tweets
end
