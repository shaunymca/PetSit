class RegistrationsController < Devise::RegistrationsController
  
  def new
    @plan = params[:plan]
    if @plan
      super
    else
      redirect_to root_path, :notice => 'Please select a subscription plan below'
    end
  end

  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
  
  #def update
  #  role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
  #  params[:user] = params[:user].except(:role_ids)
  #  super
  #  resource.update_plan(role) unless role.nil?
  #end
  
  private
  def build_resource(*args)
    super
    if params[:plan]
      resource.add_role(params[:plan])
    end
  end
  
  protected

    def after_update_path_for(resource)
      edit_user_registration_path(resource)
    end
  
  

end
