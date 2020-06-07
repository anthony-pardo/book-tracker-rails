class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      #t.integer :user_id
      #t.integer :book_id

      t.timestamps
    end
  end
end
