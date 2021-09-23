class AddImageToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :image, :string
  end
end
