module DebugStepHelpers
  def screenshot
    sleep 2
    file = "/tmp/capybara_screenshot_#{Time.now.strftime("%m_%d_%Y_%H_%M_%S")}.png"
    page.driver.render(file, :full => true)
    `open #{file}`
  end
end

World(DebugStepHelpers)

And "save the page" do
  save_page
end

And "show me the page" do
  save_and_open_page
end

And "I debug" do
  require 'pry'; binding.pry
end

And "I wait" do
  sleep(1)
end

And "show me the email" do
  current_email.save_and_open
end

And "screenshot" do
  screenshot
end
