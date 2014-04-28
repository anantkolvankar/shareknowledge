class RegistrationsController < Devise::RegistrationsController
  before_filter :user_params, only: [:update]
  def new
    super
  end

  def create
  	super
    # add custom create logic here
  end

  def update
  	puts "hi"
    super
  end
  def user_params
      params.require(:user).permit(:email, :password_confirmation,:username, :password, :current_password,:first_name, :last_name, :organization, :user_type, :permission, :avatar, :is_admin,:profile)
   end
end
