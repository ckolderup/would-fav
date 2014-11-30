class AddDefaultValueToCollectionPrivate < ActiveRecord::Migration
  def change
    change_column :collections, :private, :boolean, default: false
  end
end
