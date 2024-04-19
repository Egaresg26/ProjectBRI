# Impor modul Selenium WebDriver
Add-Type -Path "C:\Users\user\Documents\ProjectBRI\ProjectJboss\WebDriver.dll"

# Buat objek Firefox WebDriver
$driver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver("C:\Users\user\Documents\ProjectBRI\ProjectJboss\geckodriver.exe")

# Define the keywords
$keywords = "START.TSM"

# Navigate to the URL
$driver.Url = "https://172.18.247.187:8443/TAFJEE/index.html"
Start-Sleep -Seconds 10

# Click on the "Execute servlet" link
$driver.FindElementByLinkText("Execute servlet").Click()
Start-Sleep -Seconds 

# Find the search box and enter the keywords
$searchBox = $driver.FindElementByName("command")
$searchBox.SendKeys($keywords)

# Click on the submit button
$submitButton = $driver.FindElementById("submit")
$submitButton.Click()
Start-Sleep -Seconds 3

# Close the browser
#$driver.Quit()

