class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.integer :level

      t.timestamps
    end
  end
end
