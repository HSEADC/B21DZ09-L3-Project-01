json.extract! post, :id, :name, :title, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
json.like_info do
    json.liked @post_likes.dig(post.id,:liked) || false 
    json.like_count @post_likes.dig(post.id,:likes_count) || 0
end