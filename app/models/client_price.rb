class ClientPrice < ActiveRecord::Base
  attr_accessible :client_id, :price, :visit_type, :id, :default_price_id, :custom, :_destroy

  belongs_to :client
  belongs_to :default_price
  has_many :visits
  
end
