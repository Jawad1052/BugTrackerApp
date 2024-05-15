class RemoveEncryptedTitleFromBugs < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs, :encrypted_title
  end
end
