class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
  end
  
  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end
  
  def create
    @posts = Post.new(content: params[:content])
    @posts.save
    flash[:success] = '投稿しました。'
    redirect_to("/posts/index")
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    flash[:success] = '更新しました。'
    redirect_to("/posts/index")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = '削除しました。'
    redirect_to("/posts/index")
  end
  
end
