class Article < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :article_images, dependent: :destroy

  def save_images(params)
    transaction do
      params[:article_images][:image].each do |image|
        self.article_images.create!(image: image)
      end
    end
  rescue StandardError
    false
  end
  
  def self.search_by_keyword(keyword)
    joins(:user).where(["title LIKE? OR content LIKE? OR users.name LIKE?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"]) 
  end
  
  def self.search_by_grade(grade_ids)
    where(grade_id: grade_ids) 
  end

end
