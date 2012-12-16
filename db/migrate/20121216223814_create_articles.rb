class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :link
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
