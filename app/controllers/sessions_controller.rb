class SessionsController < ApplicationController
  def new
  end

  def create
    login_id = params[:session][:login_id]
    password = params[:session][:password]
    if login(login_id, password)
      flash[:success] = "ログインしました。"
      redirect_to root_url
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました。"
    redirect_to login_url
  end
  
  private
  
  def login(login_id, password)
    @user = User.find_by(login_id: login_id)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
