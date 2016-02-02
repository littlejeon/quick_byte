class AdminMailer < ApplicationMailer
  default from: "antoinfive@gmail.com"

  def sample_email
    # @user = user
    mail(to: "antoincampbell@live.com", subject: 'Sample')
  end

end
