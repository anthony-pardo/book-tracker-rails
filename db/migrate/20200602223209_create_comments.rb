class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true
      #t.integer :user_id
      #t.integer :review_id

      t.timestamps
    end
  end
end
