Given(/^I'm on Add task page$/) do
  visit 'localhost:3000'
end

Given(/^I click on Add button without Title field filled$/) do
  click_button "ADD"
  text = accept_alert
  expect(text).to eq "title is required"
end

Then(/^The task should be viewed on the page$/) do
  pry
  find('p', :text => 'test123')
end

Given(/^I create task with Title "([^"]*)" and priority "([^"]*)"$/) do |title, priority|
  fill_in("text_title", :with => title)
  select priority, :from => "button_dropdown"
  click_button "ADD"
  sleep 2
end

And(/^Verify listed order of priority$/) do

    page.body.index('High').should < page.body.index('Medium') &&
        page.body.index('Medium').should < page.body.index('Low')
    puts "######"
    sleep 1

end

Then(/^I delete task with name "([^"]*)" and priority "([^"]*)"$/) do |title, priority|

  within (find('tr', :text => "#{title} #{priority}")) do
  click_button "Delete"
    sleep 2
end
end


And(/^Verify that Title with "([^"]*)" and priority with "([^"]*)" is not listed$/) do |title, priority|
  expect(page).to have_no_css('tr', :text => "#{title} #{priority}")
end


When(/^I click on Done checkbox with Title "([^"]*)" and priority "([^"]*)"$/) do |title, priority|
  within (find('tr', :text => "#{title} #{priority}")) do
    find('input[type="checkbox"]').set (true)
    sleep 1
        end
end


Then(/^the row with Title "([^"]*)" and priority "([^"]*)" should be greyed out$/) do |title, priority|
  expect(page).to have_css('tr.selected', :text => "#{title} #{priority}")
      end

