class Medicine < ActiveRecord::Base

  has_many :medicineCategories, :dependent => :destroy
  has_many :categories, :through => :medicineCategories
  has_many :informations, :dependent => :destroy
  has_many :medicines, :through => :informations
  
  accepts_nested_attributes_for :medicineCategories, allow_destroy: true

  validates :name, :max_count, :notation, :count, :manufacturer, :perm, :price, presence: true
  validates :max_count, :count, :price, numericality: {greater_than: 0}

  # number - штук; volume - объем
  validates :notation, inclusion: {in: ['number', 'volume']}

  # 1 - по рецепту; 2 - без рецепта
  validates :perm, inclusion: {in: [1, 2]}
  
  protected

  def self.search(params)
    
    result = Medicine.includes(medicineCategories: [:category], informations: [:pharmacy]).references(medicineCategories: [:category], informations: [:pharmacy])
    
    # BYMEDICINE
    if params['name'].present?
      result = result.where(name: params['name'])
    end
    if params['max_count'].present?
      result = result.where(max_count: params['max_count'])
    end
    if params['notation'].present?
      result = result.where(notation: params['notation'])
    end
    if params['manufacturer'].present?
      result = result.where(manufacturer: params['manufacturer'])
    end
    if params['perm'].present?
      result = result.where(perm: params['perm'])
    end
    if params['price_from'].present?
      result = result.where.not(price: 0...params['price_from']) 
    end
    if params['price_to'].present?
      result = result.where(price: 0..params['price_to']) 
    end

    # BYCATEGORY
    #if params['category'].present?
    #  result = result.where(medicineCategories: {category_id: params['category']})
    #end

    # BYPHARMACY
    #if params['number'].present?
    #  result = result.where(pharmacy: {number: params['number']})
    #end
    #if params['address'].present?
    #  result = result.where(pharmacy: {address: params['address']})
    #end
    #if params['subway'].present?
    #  result = result.where(pharmacy: {subway: params['subway']})
    #end

    result.all
  end

end
