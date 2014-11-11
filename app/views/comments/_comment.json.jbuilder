json.(comment, :id, :text)
json.user do
  json.id comment.user.id
  json.email comment.user.email
end