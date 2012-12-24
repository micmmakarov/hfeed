class Api::ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @articles = Article.last_day
    render json: @articles.to_json(:methods => :score)
  end

  def show
    @article = Article.find(params[:id])

    render json: @article.to_json(:methods => :score)
  end

  def add_score
    @article = Article.find(params[:id])
    @article.add_score(current_user)
    render json: @article.to_json(:methods => :score)
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      render json: @article.to_json(:methods => :score)
    else
      render json: @article.to_json(:methods => :score)
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      render json: @article.to_json(:methods => :score)
    else
      render json: @article.to_json(:methods => :score)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: {:status => status}
  end
end
