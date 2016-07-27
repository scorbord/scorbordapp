Given(/^the following school:$/) do |table|
  table.hashes.each do |attrs|
    School.create!(attrs)
  end
end
