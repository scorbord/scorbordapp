Given(/^the user "(.*?)" has requested a password reset$/) do |email|
  user = User.find_by(email: email)
  UserMailer.password_reset_notification(user).deliver_now
end
