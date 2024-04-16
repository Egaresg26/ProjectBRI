Import-Module Selenium
# usr n pass
$username = "90171626"
$password = "0ef8Z4J5d00V51cW"

# initialize the Edge driver
$EdgeOptions = New-Object OpenQA.Selenium.Edge.EdgeOptions
$EdgeOptions.AddUserProfilePreference("detach", "True")
$driver = New-Object OpenQA.Selenium.Edge.EdgeDriver($EdgeOptions)

# Confluence Login page
$driver.Navigate().GoToUrl("https://172.18.134.83:8443/BSGUAT/servlet/BrowserServlet")
Start-Sleep -Seconds 5
$driver.FindElementById("details-button").Click()
Start-Sleep -Seconds 3
$driver.FindElementById("proceed-link").Click()
Start-Sleep -Seconds 3

# find username/email field and send the username itself to the input field
$driver.FindElementById("signOnName").SendKeys($username)
Start-Sleep -Seconds 3

# find password input field and insert password as well
$driver.FindElementById("password").SendKeys($password)
Start-Sleep -Seconds 3

# click login button
$driver.FindElementById("sign-in").Click()
Start-Sleep -Seconds 3

$error_message = "Incorrect username or password."
# get the errors (if there are)
$errors = $driver.FindElementsByCssSelector(".flash-error")
# if we find that error message within errors, then login is failed
if ($errors -ne $null -and $errors.Count -gt 0) {
    $loginSuccess = $false
    foreach ($error in $errors) {
        if ($error.Text -match $error_message) {
            Write-Host "[!] Login failed"
            $loginSuccess = $false
            break
        }
    }
    if ($loginSuccess -eq $true) {
        Write-Host "[+] Login successful"
    }
} else {
    Write-Host "[+] Login successful"
}

# close the browser
$driver.Quit()
