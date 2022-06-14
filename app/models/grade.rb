class Grade < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :users
  has_many :articles
  
  def students
    users.where(teacher: false)
  end
    
end
