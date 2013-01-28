class Client < ActiveRecord::Base
  attr_accessible :active, :address_1, :address_2, :city, :email, :first_name, :last_name, :state, :user_id, :zip, :client_prices_attributes
  belongs_to :user
  has_many :client_prices
  acts_as_gmappable :process_geocoding => false
  accepts_nested_attributes_for :client_prices
  
  before_create do
  	user.default_prices.each do |default_price|
      client_prices.build("price" => default_price.price, "visit_type" => default_price.visit_type, "default_price_id" => default_price.id)
    end
  end

  def fulladdress
    [address_1, address_2, city, state, zip].compact.join(', ')
  end  
  geocoded_by :fulladdress, :if => :fulladdressed_changed?
  after_validation :geocode 
  
  def self.search(search)
  	if search
      where("lower(last_name) LIKE ?", "%#{search.downcase}%")
  	else
    	scoped
  	end
	end
end
