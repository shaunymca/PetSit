class DefaultPrice < ActiveRecord::Base
  attr_accessible :price, :user_id, :visit_type, :id, :clients_attributes, :client_prices_attributes
  belongs_to :user
  has_many :clients, :through => :user
  has_many :client_prices, :dependent => :destroy
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :client_prices
  after_create :new_client_price
  before_update :update_clients_price
  
	private
		def new_client_price
      clients.each do |c|
        self.client_prices.create(:price => self.price, :visit_type => self.visit_type, :client_id => c.id, :custom => false)
			end
    end
  
    def update_clients_price
      self.client_prices.each do |p|
        if p.custom == false
          p.price = self.price
        	p.visit_type = self.visit_type
          p.save
        end
      end
    end
end