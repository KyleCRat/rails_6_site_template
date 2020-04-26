class CreateUserPermissionGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_permission_groups do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :permission_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
