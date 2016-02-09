class UserMailer < ActionMailer::Base

  default :from => "quickbyteapp@gmail.com"

def registration_confirmation(user, org)
    @user = user
    # binding.pry
    @org = org
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation for #{@org}")
 end

 def request_access(admin, user, org)
     @user = user
     @org = org
     @admin = admin
     mail(:to => @admin.join(""), :subject => "Grant Access for #{@org}")
  end

end
