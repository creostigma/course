class Information < ActiveRecord::Base
  
  attr_accessor :remove_medicine
  attr_accessor :remove_medicine_id
  
  after_update :destroy_medicine
  
  belongs_to :pharmacy
  belongs_to :medicine
  
  accepts_nested_attributes_for :medicine, allow_destroy: true
  
  validates :pharmacy_id, presence: true 
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :pharmacy, uniqueness: { scope: :medicine }
  
  protected
  
  def destroy_medicine
    if (remove_medicine == "true")
      relationship = Medicine.find(remove_medicine_id).informations.select{|s| s.id != self.id}
      if (relationship.empty? and (medicine_id.to_i != remove_medicine_id.to_i))
        Medicine.delete(remove_medicine_id)
      end  
    end
  end
  
end
