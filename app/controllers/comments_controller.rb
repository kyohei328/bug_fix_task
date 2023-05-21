class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :destroy]

  def create
    # binding.pry
    @comment = @blog.comments.create(comment_params)
    if @comment.save
      redirect_to blog_path(@blog)
    else
      render :show
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content, :blog_id)
  end
end
