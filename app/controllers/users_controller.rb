class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
 

  
  PER = 6
  def show
    @user = User.find_by(id: params[:id])
    # @user = Kaminari.paginate_array(@user).page(params[:page]).per(PER).order(created_at: :desc)
  end
  
  # ユーザー登録画面
  def new
    @user = User.new
  end
  
  # ユーザー登録
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name:"default_user.jpg",
      password: params[:password]
      )
  
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  # ユーザー編集画面
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  # ユーザー情報更新
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  # ユーザー情報削除
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/users/index")
  end
  
  # ログイン画面
  def login_form
  end
  
  # ログイン
  def login
    @user = User.find_by(email: params[:email])
    # 入力値チェック
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/plans/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  # ログアウト
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  # 権限チェック
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/plans/index")
    end
  end

end
