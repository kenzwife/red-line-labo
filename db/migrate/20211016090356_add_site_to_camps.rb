class AddSiteToCamps < ActiveRecord::Migration[6.1]
  def change
    add_column :camps, :site, :string
  end
end
