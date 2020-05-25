class CreateIsLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :is_likes do |t|
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps
    end
  end
end
