json.extract! @post, :id, :name, :title, :content, :created_at, :updated_at
json.comments @comments do |comment|
    json.id comment.id
    json.user_email comment.user.email
    json.body comment.body
end

json.liked @liked
json.likes_count @post.likes_count