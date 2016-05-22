Given(/^I view my account$/) do
  visit(user_path(@user))
end

Given(/^I (?:go to|visit) the (.*?) page$/) do |page_name|
  visit_path_for(page_name)
end

Then(/^I am (?:taken to|on) the (.*?) page$/) do |page_name|
  expect(current_path).to eq(path_for(page_name))
end

When(/^I fill in "(.*?)" with "(.*?)"(?: within "(.*?)")?$/) do |field, value, scope|
  if scope.present?
    within(:css, scope) { fill_in(field, with: value) }
  else
    fill_in(field, with: value)
  end
end

Then(/^I see "([^"]*?)"(?: within "(.*?)")?$/) do |text,scope|
  if scope.present?
    expect(page).to have_css(scope)
    within(:css, scope) { expect(page).to have_content(text) }
  else
    expect(page).to have_content(text)
  end
end


Then(/^I see \/([^\/]+)\/$/) do |expression|
  expect(page.text).to match(%r|#{expression}|)
end

Then(/^I do not see "(.*?)"$/) do |text|
  expect(page).to_not have_text(text)
end

Then(/^there is a field labeled "(.*?)"$/) do |label|
  expect(page).to have_field(label)
end

When(/^I click "(.*?)"(?: within "(.*?)")?$/) do |link_text, scope|
  if scope.present?
    within(:css, scope) { click_link(link_text) }
  else
    click_link(link_text)
  end
end

When(/^I find and press "(.*?)" within "(.*?)"$/) do |link_text, scope|
  if scope.present?
    within(:css, scope) { click_button(link_text) }
  else
    click_link(link_text)
  end
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

When(/^I press the javascript button "(.*?)"$/) do |id|
  @node = find_by_id(id)
  @node.trigger('click')
end

And("I wait for ajax") do
  wait_for_ajax
end