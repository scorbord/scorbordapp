Before('@seed') do

  DataFixtures.positions.each do |attrs|
    Position.find_or_create_by!(attrs)
  end

end
