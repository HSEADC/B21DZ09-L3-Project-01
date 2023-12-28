# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Дом Наркомфина — один из знаковых памятников архитектуры советского авангарда и конструктивизма. Построен в 1928—1930 годах по проекту архитекторов Моисея Гинзбурга, Игнатия Милиниса и инженера Сергея Прохорова для работников Народного комиссариата финансов СССР (Наркомфина). Автор замысла дома Наркомфина Гинзбург определял его как «опытный дом переходного типа». Дом находится в Москве по адресу: Новинский бульвар, дом 25, корпус 1. С начала 1990-х годов дом находился в аварийном состоянии, был трижды включён в список «100 главных зданий мира, которым грозит уничтожение». В 2017—2020 годах отреставрирован по проекту АБ «Гинзбург Архитектс», функционирует как элитный жилой дом. Отдельно стоящий «Коммунальный блок» (историческое название) планируется как место проведения публичных мероприятий.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')
@users = []
@tags= ["новинка","бестселлер", "куртка", "свитшот", "бомбер"]

def seed
  reset_db
  create_users(10)
  create_posts(10)
  create_comments(2..8)
  create_subscriptions(10)
  create_likes(2..20)
  create_followers(20)
end

def create_users(quantity)
  quantity.times do |i|
    user= User.create(email: Faker::Internet.email, password: "123456")
    puts "user with id #{user.id} and email #{user.email}"
    @users << user
  end
  User.create(email: "user_admin@email.ru", password: "admin1", admin: true)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_image
  uploader = PostImageUploader.new(Post.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  uploader
end

def create_posts(quantity)
  quantity.times do
    post = Post.create(title: create_sentence, content: create_sentence, post_image: upload_random_image, user: @users.sample, name: create_sentence)
    tags = @tags.sample(rand(1..4))
    post.tag_list = tags
    post.save 
    puts "Post with id #{post.id} just created"
  end
end

def create_comments(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
      comment = Comment.create(post_id: post.id, body: create_sentence, user: @users.sample)
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

def create_subscriptions(quantity)
  quantity.times do |i|
    Subscription.create(name: Faker::Name.name, telegram: "@#{Faker::Internet.username}", site: Faker::Internet.url)
  end
end

def create_likes(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
      like = PostLike.create(post_id: post.id, user: @users.sample)
      puts "Like with id #{like.id} for post with id #{like.post_id} just created"
    end
  end
end


def create_followers(quantity)  
  count = 0
  while count != quantity    
    u1 = @users.sample
    u2 = @users.sample    
    next if u1 == u2
    follower = Follower.create(subscriber: u1, publisher: u2)
    count += 1   
    puts "Follower with id #{follower.id} with subscriber id #{follower.subscriber_id} and publisher id #{follower.publisher_id}"
  end
end

seed