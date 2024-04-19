# Load Selenium module
Import-Module (Join-Path $env:USERPROFILE "Documents\automasi\Selenium.WebDriver\3.141.0\lib\netstandard2.0\Selenium.WebDriver.dll")
Import-Module (Join-Path $env:USERPROFILE "Documents\automasi\Selenium.WebDriver\3.141.0\lib\netstandard2.0\Selenium.WebDriver.Support.dll")

# Buat objek Firefox WebDriver
$driver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver("C:\Users\Administrator\Documents\automasi\geckodriver.exe")

# Definisikan kata kunci
$keywords = "START.TSM"

# Buka URL dan tunggu selama 5 detik
$driver.Navigate().GoToUrl("https://172.18.247.187:8443/TAFJEE/index.html")
$driver.Manage().Window.Maximize()
Start-Sleep -Seconds 5

# Klik tautan "Execute servlet" dan tunggu selama 3 detik
$driver.FindElementByLinkText("Execute servlet").Click()
Start-Sleep -Seconds 3

# Cari kotak teks dengan nama "command" dan masukkan kata kunci
$search_box = $driver.FindElementByName("command")
$search_box.SendKeys($keywords)

# Klik tombol submit dan tunggu selama 3 detik
$submit_button = $driver.FindElementById("submit").Click()
Start-Sleep -Seconds 3