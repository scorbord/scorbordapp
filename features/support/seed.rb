Before('@seed') do

  DataFixtures.sides.each do |side_attrs|
    Unit.find_or_create_by!(side_attrs)
  end

  DataFixtures.positions.each do |attrs|
    Position.find_or_create_by!(attrs)
  end

end
