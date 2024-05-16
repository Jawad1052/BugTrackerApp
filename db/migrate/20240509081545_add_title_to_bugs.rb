class AddTitleToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :title, :string
  end
end
