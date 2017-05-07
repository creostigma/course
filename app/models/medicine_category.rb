class MedicineCategory < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :category
  
  validates :medicine_id, :category_id, presence: true
  validates :medicine, uniqueness: {scope: :category}

end
