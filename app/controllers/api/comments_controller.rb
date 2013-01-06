class Api::CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    if params[:article_id].present?
      @comments = Comment.where(:article_id => params[:article_id])
    else
      @comments = Comment.all
    end

    render json: @comments.to_json(:methods => [:author])
    #({:include => { :comments => { :methods => :author }}, :methods => [:author]})
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment.to_json(:methods => [:author])
  end


  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      #Notification.notify_creation(@comment, current_user)
      render json: @comment.to_json(:methods => [:author])
    else
      render json: @comment.to_json(:methods => [:author])
    end
  end

  def update
    @comment = Comment.find(params[:id])
    unless @comment.user_id != current_user.id
      if @comment.update_attributes(params[:article])
        render json: @comment.to_json(:methods => [:author])
      else
        render json: @comment.to_json(:methods => [:author])
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {:status => status}
  end
end
