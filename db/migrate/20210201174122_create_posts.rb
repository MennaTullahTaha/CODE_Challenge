class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.text :body
      t.boolean :fulfilled, :default => false
      t.timestamps
    end
  end
end
