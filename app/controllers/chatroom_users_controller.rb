class ChatroomUsersController < ApplicationController
  before_action :set_team
  before_action :authenticate_user!

  def create
    @chatroom_user = @team.chatroom_users.where(user_id: current_user.id).first_or_create
    redirect_to @team
  end
  

  def destroy

  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

end
