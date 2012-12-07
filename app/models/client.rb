class Client < ActiveRecord::Base
  attr_accessible :active, :address_1, :address_2, :city, :email, :first_name, :last_name, :state, :user_id, :zip
  belongs_to :user
  
  def self.search(search)
  	if search
      where("lower(last_name) LIKE ?", "%#{search.downcase}%")
  	else
    	scoped
  	end
	end
end
