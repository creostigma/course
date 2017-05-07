class Pharmacy < ActiveRecord::Base
  has_many :informations, :dependent => :destroy

  validates :number, :address, presence: true
  validates :number, numericality: {greater_than_or_equal_to: 1}
  validates :number, uniqueness: true

end
