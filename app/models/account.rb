class Account < ActiveRecord::Base
  attr_accessible :name
  has_many :users
  has_many :clients
  has_many :default_prices
  has_many :client_prices, :through => :clients
  has_many :visits, :through => :clients

  has_many :invoices
end
