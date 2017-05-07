class Category < ActiveRecord::Base

  has_many :medicineCategories, :dependent => :destroy
  has_many :medicines, :through => :medicineCategories
  
  validates :name, presence: true

end
