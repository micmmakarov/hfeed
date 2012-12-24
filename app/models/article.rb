class Article < ActiveRecord::Base
  attr_accessible :description, :link, :title, :user_id
  has_many :scores
  belongs_to :user
  scope :last_day, where('created_at   > ?', 24.hours.ago)

  def score
    scores.length
  end

  def add_score(user)
    Score.create(:user_id => user.id, :article_id => id) if Score.where(:user_id => user.id, :article_id => id).blank?
  end
end
