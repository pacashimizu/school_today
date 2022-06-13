class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :set_grades, only: [:index, :new, :create, :edit, :update, :search]
  
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
    if @article.save
      @article.save_images(params) if params[:article_images]
      flash[:success] = "記事を投稿しました。"
      redirect_to @article

    else
      flash.now[:danger] = "記事の投稿に失敗しました。"
      render :new
    end
  end

  def edit

  end

  def update
    @article.save_images(params) if params[:article_images]

    if @article.update(article_params)
      flash[:success] = "記事を更新しました。"
      redirect_to @article
    
    else
      flash.now[:danger] = "記事の更新に失敗しました。"
      render :edit
    end
  end

  def destroy

    @article.destroy
    flash[:success] = "記事を削除しました。"
    redirect_to root_path
  end
  
  def search
    
    @keyword = params[:search][:keyword]
    @grade_id = params[:search][:grade_ids]
    
    articles = Article.all

    if @keyword.present?
      articles = articles.search_by_keyword(@keyword)
    end
    
    if @grade_id.present?
      articles = articles.search_by_grade(@grade_id)
    end
    
    @pagy, @articles = pagy(articles.order(id: :desc), item: 10)
    
    render :index
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
