class UserMailer < ApplicationMailer
    def welcome_email(user,random)
        @user=user
        @random = random
        mail(to: @user.email, subject: 'Welcome to Tweet App')
    end
end
