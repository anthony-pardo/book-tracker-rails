class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :summary
      t.string :image_url
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
