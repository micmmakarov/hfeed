class Article < ActiveRecord::Base
  attr_accessible :description, :link, :title
  has_many :scores
  has_many :comments
  belongs_to :user
  scope :last_day, where('created_at   > ?', 24.hours.ago)

  def score
    scores.length
  end

  def add_score(user)
    score = Score.where(:user_id => user.id, :article_id => id)[0]

    if score.blank?
      Score.create(:user_id => user.id, :article_id => id)
    else
      score.destroy
    end

  end

  def author
    user.name if user.present?
  end

  def comments_number
    comments.length
  end

end
