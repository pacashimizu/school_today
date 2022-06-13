class ArticleImage < ApplicationRecord
  belongs_to :article
  
  mount_uploader :image, ArticleimageUploader

end
