module UserFindOrCreate
  def find_or_create_user(attrs)
    attrs.merge!(password: 'password', password_confirmation: 'password')
    User.where(email: attrs[:email]).first_or_create!(attrs)
  end

end

World(UserFindOrCreate)