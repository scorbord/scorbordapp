class UserMailer < ActionMailer::Base

  default from: 'theteam@scorbord.com'

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: @invitation.email,
	 subject: 'Invitation to join Scorbord.com')
  end
end
