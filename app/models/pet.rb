class Pet < ActiveRecord::Base

  belongs_to :client

  attr_accessible :active, :animal_name, :birthdate, :breed, :client_id, :color, :fixed, :notes, :pet_type, :sex, :american_start_date
  attr_accessor :american_start_date
  before_save :save_american_start_date

  def american_start_date
    @american_start_date || birthdate.try(:strftime, "%m/%d/%Y")
  end

  def save_american_start_date
    self.birthdate = Chronic.parse("#{american_start_date}") if @american_start_date.present?
  end

end
