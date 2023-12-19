json.extract! post, :id, :name, :title, :content, :created_at, :updated_at
json.data @post_likes[post.id]