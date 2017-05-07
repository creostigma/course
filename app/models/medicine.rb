class Medicine < ActiveRecord::Base

  has_many :medicineCategories, :dependent => :destroy
  has_many :categories, :through => :medicineCategories
  has_many :informations, :dependent => :destroy

  validates :name, :max_count, :notation, :count, :manufacturer, :perm, :price, presence: true
  validates :max_count, :count, :price, numericality: {greater_than: 0}

  # number - штук; volume - объем
  validates :notation, inclusion: {in: ['number', 'volume']}

  # 1 - по рецепту; 2 - без рецепта
  validates :perm, inclusion: {in: [1, 2]}

end
