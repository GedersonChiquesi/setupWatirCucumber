Given("that I am in the website http://medium.com") do
  @browser.goto "http://medium.com"
  expect(@browser.title).to eq("Medium – Read, write and share stories that matter")
end

When("I search for GedersonChiquesi") do
  @browser.text_field(:class => "js-predictiveSearchInput").set "GedersonChiquesi"
end

Then("I should see the user {string}") do |string|
  user = @browser.div.span(:class => "avatar-text").text
  expect(user).to eq("Gederson Chiquesi")
  puts user
end
