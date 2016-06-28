class UserMailer < ActionMailer::Base

  default from: "Scorbord <theteam@scorbord.com>"
  layout 'mailer'

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: @invitation.email,
	 subject: 'Invitation to join Scorbord.com')
  end

  def invitation_request_admin_notify(invitation)
    @invitation = invitation
    mail(to: 'steven@scorbord.com',
	 subject: "[SB] New Invitation Request (#{invitation.first_name} #{invitation.last_name})")
  end
end
