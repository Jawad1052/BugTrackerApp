class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :actual_name

      t.timestamps
    end
  end
end
