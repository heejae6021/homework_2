class PostsController < ApplicationController
  
  def index
  end
 
  def new
    @posts = Post.all.reverse
    @post = Post.new
    @categories = Category.all
  end
 
  def create
    post = Post.new(post_params)
    post.save
    redirect_to :back
  end
  
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to new_post_path
  end 
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to new_post_path
  end
  
  private
  def post_params
    params.require(:post).permit(:name, :content, :category_id)
  end
  
end
