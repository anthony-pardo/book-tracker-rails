class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      #t.integer :book_id
      #t.integer :user_id

      t.timestamps
    end
  end
end
