Given(/^the following (?:employee|user)s?:$/) do |table|
  table.hashes.each do |attrs|
    attrs.merge!(password: 'password', password_confirmation: 'password', password_reset_token: SecureRandom.hex(20))
    User.where(email: attrs['email']).first_or_create!(attrs)
  end
end
