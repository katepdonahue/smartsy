
Given(/^I am on the "(.*?)" game play page$/) do |gene|
  visit '/games/bauhaus/play'
end

When(/^I enter a guess "(.*?)" for the artwork with id "(.*?)"$/) do |artist, art_id|
  fill_in "#{art_id}", with: artist
  click_on "Submit"
end


Then(/^I should get "(.*?)" points?$/) do |score|
  expect(page).to have_content("#{score} points")
end