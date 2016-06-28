Then /^"([^"]*)" receives an email with the subject: "([^"]*)"$/ do |email_address, subject|
  open_email(email_address)
  expect(current_email).to be_present, ->{ 'No email found for that address' }
  expect(current_email.subject).to eq(subject)
end

Then /^I receive an email with the subject: "([^"]*)"$/ do |subject|
  open_email(@user.email)
  expect(current_email).to be_present, ->{ 'No email found for that address' }
  expect(current_email.subject).to eq(subject)
end
