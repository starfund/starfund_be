json.array! @teams do |team|
  json.team json.partial! 'info', team: team, content: @with_content
end
