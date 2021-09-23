class Change < ActiveRecord::Migration[6.1]
  def change
    rename_table :loves, :goods
  end
end
