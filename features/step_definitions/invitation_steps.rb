Given(/^the following invitation request has been submitted:$/) do |table|
  table.hashes.each do |attrs|
    Invitation.create(attrs)
    @inv = Invitation.find_by(email: attrs[:email])
    #UserMailer.invitation_request_admin_notify(@inv).deliver_now
  end
end

Given(/^SuperAdmin approves the following invitation request:$/) do |table|
  table.hashes.each do |attrs|
    attrs.merge!(status: 'Approved', token: "#{SecureRandom.uuid}")
    Invitation.create(attrs)
    @inv = Invitation.find_by(attrs)
    @user = UserBuilder.new(@inv).setup_user_from_invite
    @user.save
    UserMailer.invitation_email(@inv).deliver_now
  end
end
