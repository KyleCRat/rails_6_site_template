class CreatePermissionOverrides < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_overrides do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :permissive_action, null: false, foreign_key: true
      t.boolean :permitted

      t.timestamps
    end
  end
end
