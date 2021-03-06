class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "teams:#{message.team.id}", {
      message: MessagesController.render(message),
      team_id: message.team.id 
    }
  end

 # private

  #def render_message(message)
   # MessagesController.render partial: 'messages/message', locals: {message: message}
  #end
end
