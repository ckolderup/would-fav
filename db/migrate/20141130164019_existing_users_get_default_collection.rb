class ExistingUsersGetDefaultCollection < ActiveRecord::Migration
  def change
    User.find_each do |user|
      collection = Collection.create(name: "#{user.name}'s Favorites")
      Privilege.create(user: user, collection: collection, level: :owner)
    end
  end
end
