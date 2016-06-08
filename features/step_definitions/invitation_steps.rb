Given(/^the following invitation request has been submitted:$/) do |table|
  table.hashes.each do |attrs|
    Invitation.create(attrs)
  end
end
