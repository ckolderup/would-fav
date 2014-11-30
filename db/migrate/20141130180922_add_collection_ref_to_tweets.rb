class AddCollectionRefToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :collection, index: true
  end
end
