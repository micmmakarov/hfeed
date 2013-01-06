class Comment < ActiveRecord::Base
  attr_accessible :article_id, :text
  belongs_to :user
  belongs_to :article
  has_many :comments
  belongs_to :comment
  def author
    self.user.name
  end
end
