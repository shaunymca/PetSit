class VisitBlock < ActiveRecord::Base
  attr_accessible :monday, :thursday, :tuesday, :visit_date_end, :visit_date_start, :visit_price, :visit_type, :wednesday, :friday, :saturday, :sunday
end
