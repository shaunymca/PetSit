class DefaultPrice < ActiveRecord::Base
  attr_accessible :price, :user_id, :visit_type, :id, :clients_attributes
  belongs_to :user
  has_many :clients, :through => :user
  has_many :client_prices
  accepts_nested_attributes_for :clients
  
  before_save do
    client_prices.each do |client|
      client_prices.build("price" => :price, "visit_type" => :visit_type)
    end
  end
  
end
