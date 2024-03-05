class DigestJob
  def self.perform
    user = User.find 10
    r = rand(100)
    user.email = "user-#{r}@mail.ru"
    user.save
  end
end
