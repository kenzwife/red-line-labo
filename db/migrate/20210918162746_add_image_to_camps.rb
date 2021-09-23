class AddImageToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :image, :string
  end
end
