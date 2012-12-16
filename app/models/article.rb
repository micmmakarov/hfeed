class Article < ActiveRecord::Base
  attr_accessible :description, :link, :title, :user_id
end
