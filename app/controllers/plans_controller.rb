class PlansController < ApplicationController
  before_action :authenticate_user
  
  PER = 6

  
  # 一覧画面
  def index
    @plans = Plan.page(params[:page]).per(PER).order(created_at: :desc)
  end
  
  
  # 詳細画面
  def show
    @plan = Plan.find_by(id: params[:id])
    @posts = Post.where(plan_id: params[:id])
    @user = User.find_by(id: @plan.user_id)
  end
  
  
  # 新規登録画面
  def new
    @plan = Plan.new
    @plan.posts.build
  end
  
  # DB登録
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = "投稿しました"
      redirect_to("/plans/index")
    else
      flash.now[:alert] = "投稿が失敗しました"
      render("plans/new")
    end
  end

  # 編集画面
  def edit
    @plan = Plan.find_by(id: params[:id])
    #@plan.posts.build
    @posts = Post.where(plan_id: params[:id])
    #@user = User.find_by(id: @plan.user_id)
  end
  
  # DB更新
  def update
    @plan = Plan.find_by(id: params[:id])
    if @plan.update(plan_params)
      flash[:success] = "更新しました"
      redirect_to("/plans/index")
    else
      flash.now[:alert] = "更新が失敗しました。"
      render("plans/edit")
    end
  end


  # 削除
  def destroy
    @plan = Plan.find_by(id: params[:id])
    @plan.destroy
    flash[:success] = '削除しました'
    redirect_to("/plans/index")
  end
  

  # 編集画面へのアクセス権限制御
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/plans/index")
    end
  end
  
    
  
  # strong parameter 入れ子の入力フォーム作成に使用
  private
  def plan_params
        params.require(:plan).permit(
          :plan_name,
          :prefecture_id,
          posts_attributes: [:id, :plan_id, :user_id, :plan_date, :arrival_time, :place_name, :place_image, :content, :_destroy]
        ).merge(user_id: @current_user.id)
  end
  
end