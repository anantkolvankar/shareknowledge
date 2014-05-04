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
  	puts params[:user][:avatar]
    super
  end
  def user_params
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit! }
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
   end
end
