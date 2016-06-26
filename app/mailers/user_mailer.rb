class UserMailer < ActionMailer::Base

  default from: "Scorbord <theteam@scorbord.com>"
  layout 'mailer'

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: @invitation.email,
	 subject: 'Invitation to join Scorbord.com')
  end
end
