class DigestMailer < ApplicationMailer
    default from: 'favias_team@mail.ru'

    def digest(user)
        @user = user
        @posts = user.digest

        mail(to: @user.email, subject: 'Digest')
    end
end
