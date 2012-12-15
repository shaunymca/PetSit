class DefaultPrice < ActiveRecord::Base
  attr_accessible :price, :user_id, :visit_type, :id
  belongs_to :user
end
