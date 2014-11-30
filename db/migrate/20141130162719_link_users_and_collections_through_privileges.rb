class LinkUsersAndCollectionsThroughPrivileges < ActiveRecord::Migration
  def change
    change_table :privileges do |t|
      t.belongs_to :user
      t.belongs_to :collection
    end
  end
end
