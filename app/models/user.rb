class User < ActiveRecord::Base
  has_many :clients
  belongs_to :account
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :omniauthable, :omniauth_providers => [:stripe_connect]

  # Setup accessible (or protected) attributes for your model

  attr_accessible :role_ids, :account_id, :name, :account_attributes, :account, :time_zone, :email,
                   :password, :password_confirmation, :remember_me, :stripe_token,
                   :default_prices_attributes, :client_prices_attributes, :provider, :uid
  attr_accessor :stripe_token
  before_save :update_stripe
  after_create :welcome_email
  before_destroy :cancel_subscription
  has_many :default_prices
  has_many :client_prices, :through => :clients
  has_many :invoices
  has_many :visits
  accepts_nested_attributes_for :default_prices, :allow_destroy => true
  accepts_nested_attributes_for :account

  #upmin_attributes :account_name

  def update_plan(role)
    self.role_ids = []
    self.add_role(role.name)
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      customer.update_subscription(:plan => role.name)
    end
    true
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message + self.email
    errors.add :base, "Unable to update your subscription. #{e.message}."
    false
  end

  def update_stripe
    return if email.include?(ENV['ADMIN_EMAIL'])
    return if email.include?('@example.com') and not Rails.env.production?
    return if invited_by_id.present?
    if customer_id.nil?
      if !stripe_token.present?
        raise "Stripe token not present. Can't create account."
      end
        customer = Stripe::Customer.create(
          :email => email,
          :description => name,
          :card => stripe_token,
          :plan => roles.first.name
        )
    else
      customer = Stripe::Customer.retrieve(customer_id)
      if stripe_token.present?
        customer.card = stripe_token
      end
      customer.email = email
      customer.description = name
      customer.save
    end
    self.last_4_digits = customer.cards.data.first["last4"]
    
    self.customer_id = customer.id
    self.stripe_token = nil
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "#{e.message}."
    self.stripe_token = nil
    false
  end

  def cancel_subscription
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      unless customer.nil? or customer.respond_to?('deleted')
        if (customer.subscription.status == 'active' or customer.subscription.status == 'trialing')
          customer.cancel_subscription
        end
      end
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "Unable to cancel your subscription. #{e.message}."
    false
  end

  def expire
    UserMailer.expire_email(self).deliver
    destroy
  end

  def welcome_email
    unless self.has_role? :walker
      UserMailer.new_email(self).deliver
    end
  end

  def account_name
    self.account.name
  end

end
