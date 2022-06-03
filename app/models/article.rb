class Article < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  
  def self.search_by_keyword(keyword)
    where(["title LIKE? OR content LIKE?", "%#{keyword}%", "%#{keyword}%"]) 
  end
  
  def self.search_by_grade(grade_ids)
    where(grade_id: grade_ids) 
  end

end
