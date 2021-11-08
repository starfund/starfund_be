json.array! @orgs do |organization|
  json.organization json.partial! 'info', organization: organization
end
