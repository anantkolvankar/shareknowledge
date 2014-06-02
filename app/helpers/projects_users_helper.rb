module ProjectsUsersHelper

  def user_options
    @users.collect{|u| [u.email, u.id] }
  end
  
end
