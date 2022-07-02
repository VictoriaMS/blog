class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :header
      t.text :body
      t.references :users
      t.timestamps
    end
  end
end
