class Client < ActiveRecord::Base
  attr_accessible :active, :address_1, :address_2, :city, :email, :first_name, :last_name, :state, :user_id, :zip, :client_prices_attributes
  belongs_to :user
  has_many :client_prices
  acts_as_gmappable :process_geocoding => false
  accepts_nested_attributes_for :client_prices, :allow_destroy => true
  
  before_create do
  	user.default_prices.each do |default_price|
      client_prices.build("price" => default_price.price, "visit_type" => default_price.visit_type, "default_price_id" => default_price.id, "custom" => 0)
    end
  end

  def fulladdress
    [address_1, address_2, city, state, zip].compact.join(', ')
  end  
  geocoded_by :fulladdress, :if => :fulladdressed_changed?
  after_validation :geocode 
  
  def self.search(search)
  	if search
      where("lower(last_name) LIKE ?", "%#{search.downcase}%")
  	else
    	scoped
  	end
	end

  def self.import(file,user_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      row["user_id"] = user_id
      Client.create! row.to_hash
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end
