Then(/^(.*?) in the "(.*?)" section$/) do |action, identifier|
  containers = %w(section article fieldset).map{|e| "//#{e}"}.join('|')
  elements   = %w(h1 h2 h3 h4 h5).map{|e| "descendant-or-self::#{e}"}.join('|')
  within("((#{containers})[(#{elements})[contains(.,'#{identifier}')]])[last()]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" card menu$/) do |action, identifier|
  thecard = "(//div[contains(@class,'mdl-card')][//div[contains(@class,'mdl-card__title')][contains(.,'#{identifier}')]])"
  within ("#{thecard}//div[contains(@class,'mdl-card__menu')]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" card actions$/) do |action, identifier|
  thecard = "//div[div[contains(@class,'mdl-card__title')][contains(.,'#{identifier}')]]"
  within ("#{thecard}[div[contains(@class,'mdl-card__actions')]]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" card title$/) do |action, identifier|
  thecard = "(//div[contains(@class,'mdl-card')][//div[contains(@class,'mdl-card__title')][contains(.,'#{identifier}')]])"
  within ("#{thecard}//div[contains(@class,'mdl-card__title')]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" modal definition list$/) do |action, fieldset|
  within("//div[@id='modal']//dl[dt[contains(.,'#{fieldset}')]]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" definition list$/) do |action, fieldset|
  within("//dl[dt[contains(.,'#{fieldset}')]]") do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" list$/) do |action, scope|
  within("(//fieldset|//section)[contains(.,'#{scope}')][last()]//ul") do
    step(action)
  end
end

When(/^(.*?) inside the "(.*?)" row/) do |action, scope|
  within("//tr[contains(.,'#{scope}')]") do
    step(action)
  end
end

When(/^(.*?) inside the "(.*?)" list item$/) do |action, scope|
  within("//ul/li[contains(.,'#{scope}')]") do
    step(action)
  end
end

Then(/^(.*?) in the modal$/) do |action|
  expect(page).to have_css("#modal")
  within("//div[@id='modal']") do
    step(action)
  end
end

Then(/^(.*?) in the content area$/) do |action|
  within("//body/div[@id='content']") do
    step(action)
  end
end

Then(/^(.*?) in the header$/) do |action|
  within("//body/header") do
    step(action)
  end
end

Then(/^(.*?) in the email for '(.*?)'$/) do |action, email_address|
  email = open_email(email_address)
  expect(email).to be_present, ->{ 'Expected to find email' }
  within(email) do
    step(action)
  end
end

Then(/^(.*?) in the "(.*?)" row$/) do |action, row_identifier|
  within("//table//tr[contains(.,'#{row_identifier}')]") do
    step(action)
  end
end

Then(/^(.*?) in the nested "(.*?)" row$/) do |action, row_identifier|
  within("//table//tr//tr[contains(.,'#{row_identifier}')]") do
    step(action)
  end
end

Then(/^(.*?) in the new window$/) do |action|
  count = 0
  while page.driver.browser.window_handles.count < 2
    sleep 0.05
    raise "Timeout during wait for new window to pop up" if ( count +=1 ) > 100
  end

  page.driver.browser.within_window(page.driver.browser.window_handles.last) do
    step(action)
  end
end

Given(/^(.*?) in the account menu$/) do |action|
  page.evaluate_script %Q{$('.user_nav').addClass('active')}
  within('//div[contains(@class,"user_nav")]') do
    step(action)
  end
end
