Given(/^I'm on Add task page$/) do
  visit 'file:///C:/Users/sjoseph/Desktop/Assignment1/index.htm'
end


Then(/^the page should have Title text box$/) do
  find('input[class="rounded2"]')
end


And(/^page should have Add button$/) do
  find('button[class="btn btn-success"]')
end


# Given(/^I create a new task with filling text on Title box$/) do
#   find('input[class="rounded2"]').click
#   fill_in("title", :with => "test123")
# end
#
# And(/^select priority from dropdown$/) do
#   select"Medium", :from => "button_dropdown"
# end
#
# When(/^Click on Add button$/) do
#   click_button "Add"
#   sleep 2
# end


Then(/^The task should be viewed on the page$/) do
  find('p', :text => 'test123')
end

Given(/^I create task with Title "([^"]*)" and priority "([^"]*)"$/) do |title, priority|
  fill_in("title", :with => title)
  select priority, :from => "button_dropdown"
  click_button "Add"
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
  find('input[type="button"]').click
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
  expect(page).to have_css('tr', :text => "#{title} #{priority}")
      end