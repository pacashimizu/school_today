class UsersController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_grades, only: [:new, :edit]
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def index
    @pagy, @users = pagy(User.where(teacher: false), items: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to users_url
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:success] = "ユーザを更新しました。"
      redirect_to users_url
    else
      flash.now[:danger] = "ユーザの更新に失敗しました。"
      render :edit
    end
  end

  def destroy

    @user.destroy
    flash[:success] = "ユーザを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def teachers
    @pagy, @users = pagy(User.where(teacher: true).order(id: :desc), items: 10)
  end

  private
  
  def set_grades
    @grades = Grade.all
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :login_id, :password, :password_confirmation, :comment, :teacher, :grade_id, :image, :remove_image)
  end

end
