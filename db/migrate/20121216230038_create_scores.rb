class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end

    add_index :scores, [:article_id, :user_id], :unique => true

  end
end
