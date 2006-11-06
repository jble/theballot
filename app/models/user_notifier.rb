class UserNotifier < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://#{user.signup_domain}/account/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @recipients  = "seth@radicaldesigns.org,sam@indyvoter.org"
    @subject    += "new account: #{user.email}"
  end

  def forgot_password(user)
    setup_email(user)
    @subject    += 'Request to change your password'
    @body[:url]  = "http://#{user.current_domain}/account/reset_password/#{user.password_reset_code}" 
  end

  def reset_password(user)
    setup_email(user)
    @subject    += 'Your password has been reset'
  end  

  def login_incorrect(email)
    @recipients = "sam@indyvoter.org, seth@indyvoter.org"
    @from = "voterguides@indyvoter.org"
    @subject = "[THEBALLOT] - failed login"
    @body[:email] = email
    @body[:user] = User.find_by_email(email)
  end

  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "voterguides@indyvoter.org"
    @subject     = "[voterguides] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
