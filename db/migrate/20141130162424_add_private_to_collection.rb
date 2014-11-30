class AddPrivateToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :private, :boolean
  end
end
