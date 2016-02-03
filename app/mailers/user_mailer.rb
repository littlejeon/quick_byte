class UserMailer < ActionMailer::Base
    default :from => "antoinfive@gmail.com"

 def registration_confirmation(user, org)
    @user = user
    binding.pry
    @org = org
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation for #{@org}")
 end
end
