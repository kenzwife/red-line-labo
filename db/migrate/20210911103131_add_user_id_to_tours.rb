class AddUserIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :user_id, :integer
  end
end
