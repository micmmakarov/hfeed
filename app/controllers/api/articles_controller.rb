class Api::ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    Article.current_user = current_user if user_signed_in?
    #Thread.current[:user] = current_user
    if params[:data] == 'highlights'
      @articles = Article.highlights
    else
      @articles = Article.last_day_or_seven
    end
    render json: @articles.to_json(:methods => [:score, :scorable, :author, :comments_number])
  end

  def show
    Article.current_user = current_user if user_signed_in?
    @article = Article.find(params[:id])

    render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
  end

  def add_score
    Article.current_user = current_user if user_signed_in?
    @article = Article.find(params[:id])
    @article.add_score(current_user)
    render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
  end

  def create
    Article.current_user = current_user if user_signed_in?
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      #Notification.notify_creation(@article, current_user)
      render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
    else
      render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
    end
  end

  def update
    Article.current_user = current_user if user_signed_in?

    @article = Article.find(params[:id])
    unless @article.user_id != current_user.id
      if @article.update_attributes(params[:article])
        render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
      else
        render json: @article.to_json(:methods => [:score, :scorable, :author, :comments_number])
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: {:status => status}
  end
end
