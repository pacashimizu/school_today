class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :set_grades, only: [:new, :edit]
  
  def index
    @pagy, @articles = pagy(Article.order(id: :desc), item: 10)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    @grades = Grade.all
    
    if @article.save
      flash[:success] = "記事を投稿しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "記事の投稿に失敗しました。"
      render :new
    end
  end

  def edit

  end

  def update

    if @article.update(article_params)
      flash[:success] = "記事を更新しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "記事の更新に失敗しました。"
      render :new
    end
  end

  def destroy

    @article.destroy
    flash[:success] = "記事を削除しました。"
    redirect_to root_path
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def set_grades
    @grades = Grade.all
  end
  
  def article_params
    params.require(:article).permit(:title, :content, :grade_id)
  end
end
