module UserFindOrCreate
  def find_or_create_user(attrs)
    attrs.merge!(password: 'password', password_confirmation: 'password')
    tmpusr = User.where(email: attrs[:email]).first_or_create!(attrs)
    tmpusr.person = Person.where(first_name: attrs[:first_name], last_name: attrs[:last_name]).first_or_create!
    user = tmpusr
  end

end

World(UserFindOrCreate)
