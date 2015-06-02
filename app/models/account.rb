class Account < ActiveRecord::Base
  attr_accessible :name
  has_many :users, :dependent => :destroy
  has_many :clients, :dependent => :destroy
  has_many :default_prices, :dependent => :destroy
  has_many :client_prices, :through => :clients, :dependent => :destroy
  has_many :visits, :through => :clients, :dependent => :destroy

  has_many :invoices, :dependent => :destroy
end
