class CreatePostcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :postcomments do |t|
      t.integer :user_id
      t.text :body
      t.integer :book_id

      t.timestamps
    end
  end
end
