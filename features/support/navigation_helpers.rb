module NavigationHelpers
  def paths(path_name)
    # set up a hash with a default of unrolling to a path method
    h = Hash.new{|hash,key| hash[key] = send("#{path_name}_path") }
    # add overrides
    h.merge!({ home: "/" })
    # find and return a key or the default
    h[path_name]
  end

  def path_for(path_name)
    paths keyify_path_name(path_name)
  end

  def keyify_path_name(path_name)
    path_name.parameterize("_").to_sym
  end

  def visit_path_for(path_name)
    visit path_for(path_name)
  end
end

World(NavigationHelpers)