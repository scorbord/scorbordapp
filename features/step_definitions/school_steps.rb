Given(/^the following school:$/) do |table|
  table.hashes.each do |attrs|
    School.create!(attrs)
  end
end

Given(/^there is a school$/) do
  @school = School.create!(name: "Abide High School",
		 initials: "AHS",
		 mascot: "White Russians")
end
