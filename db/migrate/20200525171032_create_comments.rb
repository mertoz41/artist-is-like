class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :is_like_id
      t.text :comment_body

      t.timestamps
    end
  end
end
