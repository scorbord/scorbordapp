Given(/^the following team:$/) do |table|
	table.hashes.each do |attrs|
    Team.create!(attrs)
  end
end