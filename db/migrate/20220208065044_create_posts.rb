class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :image_id
      t.string :prefectures

      t.timestamps
    end
  end
end
