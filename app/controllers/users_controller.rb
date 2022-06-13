class UsersController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_grades, only: [:index, :new, :edit, :teachers, :search, :search_teachers]
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def index
    @pagy, @users = pagy(User.where(teacher: false).order(id: :desc), items: 10)
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
  
  def search
    users = User.where(teacher: false)

    @name = params[:search][:name]
    @grade_id = params[:search][:grade_ids]

    if @name.present?
      users = users.search_by_name(@name)
    end
    
    if @grade_id.present?
      users = users.search_by_grade(@grade_id)
    end
    
    @pagy, @users = pagy(users.order(id: :desc), item: 10)
    render :index
  end 
  
  def search_teachers
    users = User.where(teacher: true)
   
    @name = params[:search][:name]
    @grade_id = params[:search][:grade_ids]

    if @name.present?
      users = users.search_by_name(@name)
    end
    
    if @grade_id.present?
      users = users.search_by_grade(@grade_id)
    end
    
    @pagy, @users = pagy(users.order(id: :desc), item: 10)
    render :teachers
  end

  private
  
  def set_grades
    if action_name == "index" || action_name == "search"
      @grades = Grade.where.not(id: 1)
    else
      @grades = Grade.all
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :login_id, :password, :password_confirmation, :comment, :teacher, :grade_id, :image, :remove_image)
  end

end
