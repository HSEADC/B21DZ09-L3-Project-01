class DigestJob
  def self.perform
    User.find_each do |user|
      DigestMailer.digest(user).deliver_later
    end
  end
end
