Given(/^the following invitation request has been submitted:$/) do |table|
  table.hashes.each do |attrs|
    Invitation.create(attrs)
    @inv = Invitation.find_by(email: attrs[:email])
    #UserMailer.invitation_request_admin_notify(@inv).deliver_now
  end
end
