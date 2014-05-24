class ProjectsUsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @project = Project.find(params[:project_id])
    user_filter = [@project.user_id]
    user_filter += @project.projects_users.map(&:user_id)
    @users = User.where("id not in (?)", user_filter)
    @projects_user = @project.projects_users.build
  end

  def create
    @project = Project.find(params[:projects_user][:project_id])
    params[:projects_user][:user_ids].each do |user_id|
      ProjectsUser.create(project_id: @project.id, user_id: user_id)
    end
    redirect_to dashboard_path(@project), notice: 'Project shared successfully'
  end
end
