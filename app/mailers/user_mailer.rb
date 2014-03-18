class UserMailer < ActionMailer::Base
  default :from => "support@petsitterspal.com"

  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end

  def new_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to PetsittersPal")
  end

end
