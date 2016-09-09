class MessagesController < ApplicationController
  before_action :set_team
  before_action :authenticate_user!

  def create
    message = @team.messages.new(message_params)
    message.user = current_user
    message.save
    MessageRelayJob.perform_later(message)
    #redirect_to @team
  end


  private

  def message_params
    params.require(:message).permit(:body)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
