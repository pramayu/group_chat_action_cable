# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TeamsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.teams.each do |team|
      stream_from "teams:#{team.id}"
    end
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    #@team = Team.find(date["team_id"])
    #message = @team.messages.create(body: data["body"], user: current_user)
    #MessageRelayJob.perform_later(message)
  end
end
