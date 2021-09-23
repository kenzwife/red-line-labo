class CreateCamps < ActiveRecord::Migration[6.1]
  def change
    create_table :camps do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :genre

      t.timestamps
    end
  end
end
