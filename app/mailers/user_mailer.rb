class UserMailer < ActionMailer::Base

  default from: "Scorbord <theteam@scorbord.com>"
  layout 'mailer'

  def invitation_email(invitation)
    @invitation = invitation
		formatted_recipient = %("#{@invitation.first_name} #{@invitation.last_name}" <#{@invitation.email}>)
    mail(to: formatted_recipient,
	 				subject: 'Invitation to join Scorbord.com')
  end

  def invitation_request_admin_notify(invitation)
    @invitation = invitation
    mail(to: 'steven@scorbord.com',
				 subject: "[SB] New Invitation Request (#{invitation.first_name} #{invitation.last_name})")
  end

	def password_reset_notification(user)
		@user = user
		formatted_recipient = %("#{@user.first_name} #{@user.last_name}" <#{@user.email}>)
		mail(to: formatted_recipient,
				 subject: "Password Reset Instructions")
	end

end
