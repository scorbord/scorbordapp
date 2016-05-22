require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  #Capybara::Poltergeist::Driver.new(app,phantomjs_options: ['--load-images=no'], js_errors: false)
	Capybara::Poltergeist::Driver.new(app,phantomjs_options: ['--load-images=no'], js_errors: false, :window_size => [1100,1100])
end

