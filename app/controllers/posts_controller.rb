class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  
  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
    @plan = Plan.new
  end
  
  def create
    @posts = Post.new(
      content: params[:content],
      plan_date: params[:plan_date],
      arrival_time: params[:arrival_time],
      # place_image: params[:place_image],
      place_image: "default_post.jpg",
      place_name: params[:place_name],
      user_id: @current_user.id
      )
    
    if params[:place_image]
      @post = Post.find_by(id: params[:id])
      # @post.place_image = "#{@post.id}.jpg"
      image = params[:place_image]
      # File.binwrite("public/place_images/#{@posts.place_image}",image.read)
      File.binwrite("public/place_images/default_post.jpg",image.read)
    end
      
    if @posts.save
      flash[:notice] = "プランを作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
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
  
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  
  def plan_params
        params.require(:plan).permit(
          :plan_name,
          posts_attributes: [:id, :plan_id, :content, :plan_date, :arrival_time, :place_image, :place_name, :_destroy]
        )
  end
  
end
