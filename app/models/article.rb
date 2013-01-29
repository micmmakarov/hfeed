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

  def Article.dayly_news
    start_date = Article.first.created_at
    end_date = Article.last.created_at
    articles = []
    days = (end_date.to_date - start_date.to_date).to_i
    days.times do |t|
      date = start_date + t.days
      article = Article.where(:created_at => date).order("created_at DESC").first
      articles.push(article)
    end
    articles
  end


end
