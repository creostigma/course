class Information < ActiveRecord::Base
  belongs_to :pharmacy
  belongs_to :medicine
  
  validates :pharmacy_id, :medicine_id, presence: true 
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :pharmacy, uniqueness: { scope: :medicine }

end
