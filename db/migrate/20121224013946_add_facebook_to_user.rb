class AddFacebookToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :facebook, :integer, :limit => 8
  end
end
