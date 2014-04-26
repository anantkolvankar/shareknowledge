class RegistrationsController < Devise::RegistrationsController
 
 def update
 	super
 end
  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def user_params
      params.require(:user).permit(:username, :password, :current_password,:first_name, :last_name, :organization, :user_type, :permission, :avatar, :is_admin,:profile)
    end
end
