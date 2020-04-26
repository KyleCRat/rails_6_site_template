class CreatePermissionGroupActions < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_group_actions do |t|
      t.belongs_to :permissive_action, null: false, foreign_key: true
      t.belongs_to :permission_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
