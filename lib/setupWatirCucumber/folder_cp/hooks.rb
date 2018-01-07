Before do |scenario|
  @path_screenshots = "screenshots/#{scenario.feature.name}/#{scenario.name}"
  FileUtils.mkpath @path_screenshots 
end

AfterStep do |step|
  screenshot = "#{@path_screenshots}/#{Time.now.strftime("%d%m%Y%H%M")}.png"
  @browser.screenshot.save(screenshot)
  embed screenshot , 'image/png'
end

After do |scenario|
  @browser.cookies.clear rescue warn 'No session to clear'
  @browser.refresh
end