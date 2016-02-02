class UserMailer < ActionMailer::Base
    default :from => "current_user.email"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end
end
