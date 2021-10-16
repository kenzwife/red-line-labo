class AddSiteToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :site, :string
  end
end
