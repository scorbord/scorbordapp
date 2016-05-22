Given(/^the following (?:employee|user)s?:$/) do |table|
  table.hashes.each do |attrs|
    attrs.merge!(password: 'password', password_confirmation: 'password')
    User.where(email: attrs['email']).first_or_create!(attrs)
  end
end
