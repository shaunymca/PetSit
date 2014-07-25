class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def stripe_connect
        # Delete the code inside of this method and write your own.
        # The code below is to show you where to access the data.
        omni = request.env["omniauth.auth"]
        #raise omni['credentials']['token'].to_yaml
        @account = current_user.account
        @account.uid = omni['uid']
        @account.access_token = omni['credentials']['token']
        @account.publishable_key = omni['info']['stripe_publishable_key']
        @account.provider = omni['provider']
        if @account.save
            flash[:notice] = "Stripe Saved"
            redirect_to edit_user_registration_path
        end
    end
end