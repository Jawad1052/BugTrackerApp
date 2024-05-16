class ChangeUserIdToNullableInBugs < ActiveRecord::Migration[6.1]
  def change
    change_column_null :bugs, :user_id, true
  end
end
