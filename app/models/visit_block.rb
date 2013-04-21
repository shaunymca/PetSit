class VisitBlock < ActiveRecord::Base
  attr_accessible :monday, :thursday, :tuesday, :american_end_date, :american_start_date, :visit_price, :visit_type, :wednesday, :friday, :saturday, :sunday, :time_text, :client_id, :client_name, :client_prices_id, :visits_attributes
  attr_accessor :client_prices_id
  belongs_to :client
  has_many :visits
  accepts_nested_attributes_for :visits
  attr_writer :american_start_date, :american_end_date, :time_text
  before_save :save_american_start_date, :save_american_end_date
  
  after_commit :new_visit

  def client_prices_id
  end
  
  def client_name
    client.try(:id)
  end
  
  def client_name=(last_name)
    self.client = Client.find_by_last_name(id) if last_name.present?
  end
  
  def client_prices_id
  end
  
  def time_text
  end
  
  def american_start_date
    @american_start_date || visit_date_start.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_start_date
    self.visit_date_start = Chronic.parse("#{american_start_date} #{time_text}").in_time_zone if @american_start_date.present?
  end
  
  def american_end_date
    @american_end_date || visit_date_end.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_end_date
    self.visit_date_end = Chronic.parse("#{american_end_date} #{time_text}").in_time_zone if @american_start_date.present?
  end
  
  private  
    #def new_visit  
    #  day = 0
    #  dates = (visit_date_start .. visit_date_end).count + 1
    #  while day <= dates
    #    vt = visit_time.to_s
    #    t = DateTime.strptime(vt, format).to_time
    #    d =  DateTime.parse(visit_date_start + " " + t)
    #    thisdate = d + day
    #    day_of_week = thisdate.strftime("%A").downcase
    #    if 1==1
    #      visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
    #      day += 1
        #if (day_of_week == 'sunday') or (day_of_week == 'monday') or (day_of_week == 'tuesday') or (day_of_week == 'wednesday') or (day_of_week == 'thursday') or (day_of_week == 'friday') or (day_of_week == 'saturday')
        #if (day_of_week == 'sunday' and sunday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'monday' and monday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'tuesday' and tuesday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'tuesday' and tuesday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'wednesday' and wednesday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'thursday' and thursday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'friday' and friday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #elsif (day_of_week == 'saturday' and saturday == true)
        #  visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => thisdate)
        #  day += 1
        #else
        #  day += 1
        #end
      #end
    #end 
end