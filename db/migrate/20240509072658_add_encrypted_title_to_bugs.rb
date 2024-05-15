class AddEncryptedTitleToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :encrypted_title, :string
  end
end
