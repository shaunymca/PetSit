class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def stripe_connect
        # Delete the code inside of this method and write your own.
        # The code below is to show you where to access the data.
        omni = request.env["omniauth.auth"]
        #raise omni['provider'].to_yaml
        @user = current_user
        @user.uid = omni['uid']
        @user.access_token = omni['info']['stripe_publishable_key']
        @user.provider = omni['provider']
        if @user.save
            flash[:notice] = "Stripe Saved"
            redirect_to edit_user_registration_path
        end
    end
end