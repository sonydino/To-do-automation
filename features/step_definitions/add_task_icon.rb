Given(/^I click on Add task icon$/) do
  visit 'file:///C:/Users/sjoseph/Desktop/Assignment1/index.htm'
  find('.fa.fa-plus', :wait => 5).click
end

And(/^I navigate to Add task page$/) do
  expect(find('h1')).to have_text 'Add Task'
end

Then(/^the page should have buttons$/) do |button_table|
  # table is a table.hashes.keys # => [:save]
  button_table.raw.flatten.each {|button| puts expect(page).to have_button button}


end

And(/^the page should have text box$/) do |text_table|
  # table is a table.hashes.keys # => [:Title]
  text_table.raw.flatten.each {|textbox| puts expect(page).to have_text textbox}

end

And(/^the page should have the date and time range$/) do
  expect(page).to have_css("input[type='date']")
  expect(page).to have_css("input[name='usr_time']")
end

Given(/^I create new task with filling up following fields$/) do |form_table|
  puts form_table.hashes
  fill_form(form_table.hashes)
end

And(/^click on submit button$/) do
  click_button "Submit"
end


Given(/^On the Add task page click on Submit button without filling any value$/) do
  step("click on submit button")
end

Then(/^Verify the Title field should take only (\d+) characters$/) do |arg|
  expect(find('#text_title')[:maxlength]).to eq('50')
end

And(/^Description should take onbly (\d+) characters$/) do |arg|
  expect(find('#text_descripton')[:maxlength]).to eq('250')
end

Given(/^On add task page click on Back icon$/) do
  find('.fa-arrow-left', :wait => 5).click
end

Given(/^I go to Add task page$/) do
  find('.fa.fa-plus', :wait => 5).click
end

When(/^I click on Reset page$/) do
  click_button "Reset"
end

Then(/^Page should get reset$/) do
  puts "####################################################"
 expect(find_field('text_title').value).to eq""

end


