App.teams = App.cable.subscriptions.create "TeamsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
  	$("[data-behavior='messages'][data-team-id='#{data.team_id}']").append(data.message)
	
  send_message: (team_id, message) ->
  	@perform "send_message", {team_id: team_id, message: message}
