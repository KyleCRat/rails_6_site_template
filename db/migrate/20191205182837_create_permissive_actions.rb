class CreatePermissiveActions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissive_actions do |t|
      t.string :klass
      t.string :action

      t.timestamps
    end
  end
end
