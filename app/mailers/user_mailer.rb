class UserMailer < ActionMailer::Base
    default :from => "current_user.email"

 def registration_confirmation(user, org)
    @user = user
    @org = org
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation for #{@org}")
 end
end
