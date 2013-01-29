class Article < ActiveRecord::Base
  cattr_accessor :current_user
  attr_accessible :description, :link, :title
  has_many :scores
  has_many :comments
  belongs_to :user
  scope :last_day, where('created_at   > ?', 24.hours.ago)


  def score
    scores.length
  end

  def scorable
    if current_user.present?
      not Score.where(:user_id => current_user.id, :article_id => id).first.present?
    end
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

  def Article.last_day_or_seven
    if last_day.length < 7
      Article.order("created_at DESC").limit(7)
    end
  end


end
