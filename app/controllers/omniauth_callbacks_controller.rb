class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    # Delete the code inside of this method and write your own.
    # The code below is to show you where to access the data.
    #omni = request.env["omniauth.auth"]
    #raise omni.env['code']
    @user = current_user

  end
end