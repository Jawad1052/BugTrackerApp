class RemoveTitleFromBugs < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs, :title
  end
end
