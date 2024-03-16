# Preview all emails at http://localhost:3000/rails/mailers/digest_mailer
class DigestMailerPreview < ActionMailer::Preview
    def digest_email
        user = User.find(20)
        DigestMailer.digest(user)
    end
end
