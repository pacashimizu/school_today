class User < ApplicationRecord
  belongs_to :grade

  mount_uploader :image, UserimageUploader
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :login_id, presence: true, length: { minimum: 2 }, format: { with: /\A[a-zA-Z0-9]+\z/ }, uniqueness: true
  validates :teacher, inclusion: { in: [true, false] }
  
  has_secure_password
  
  has_many :articles
  
  def self.search_by_name(name)
    where(["name LIKE?", "%#{name}%"])
  end
  
  def self.search_by_grade(grade_ids)
      where(grade_id: grade_ids)
  end
end
