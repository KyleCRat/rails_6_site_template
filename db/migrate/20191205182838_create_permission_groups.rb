class CreatePermissionGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_groups do |t|
      t.string :title
      t.string :type
    end
  end
end
