class ArticleImagesController < ApplicationController
  def destroy
    @article_image = ArticleImage.find(params[:id])
    @article_image.destroy
    redirect_back(fallback_location: root_path)
  end
end
