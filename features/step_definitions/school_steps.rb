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

Given(/^there is a (.*?) program for "(.*?)"$/) do |sport, school|
  @school = School.find_by(name: school)
  if sport == "Football"
    sport = 1
  elsif sport == "Basketball"
    sport = 2
  end
  @program = @school.programs.create!(sport: sport)
end

