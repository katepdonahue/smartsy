
Given(/^I am on the game play page$/) do
  visit game_path
end

When(/^I enter a guess "(.*?)" for the artwork with id "(.*?)"$/) do |artist, art_id|
  expect(page).to have_content()
end

Then(/^I should get a point$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not get a point$/) do
  pending # express the regexp above with the code you wish you had
end