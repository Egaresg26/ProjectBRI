# Load WinApi functions
Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class WinApi {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool SwitchToThisWindow(IntPtr hWnd, bool fAltTab);

        [DllImport("user32.dll", SetLastError = true)]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern IntPtr SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
    }
"@

# Run quit.bat as administrator
Start-Process -FilePath .\quit.bat -Verb RunAs
Add-Type -AssemblyName System.Windows.Forms

Start-Sleep -Seconds 5

Start-Process -FilePath .\quit.bat -Verb RunAs
Add-Type -AssemblyName System.Windows.Forms

# Start TSA service
[System.Windows.Forms.SendKeys]::SendWait("TS, I TSM{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("6{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("START{ENTER}")
Start-Sleep -Seconds 3

# Paste command from clipboard
[System.Windows.Forms.SendKeys]::SendWait("^V{ENTER}")
Start-Sleep -Seconds 3

# Return to main menu
[System.Windows.Forms.SendKeys]::SendWait("^U{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("^U{ENTER}")
Start-Sleep -Seconds 3

# Impor modul Selenium WebDriver
Add-Type -Path "C:\Users\user\Documents\ProjectBRI\ProjectJboss\WebDriver.dll"

# Buat objek Firefox WebDriver
$driver = New-Object OpenQA.Selenium.Firefox.FirefoxDriver

# Define the keywords
$keywords = "START.TSM"

# Navigate to the URL
$driver.Url = "https://172.18.247.187:8443/TAFJEE/index.html"
$driver.Manage().Window.Maximize()
Start-Sleep -Seconds 5

# Click on the "Execute servlet" link
$driver.FindElementByLinkText("Execute servlet").Click()
Start-Sleep -Seconds 3

# Find the search box and enter the keywords
$searchBox = $driver.FindElementByName("command")
$searchBox.SendKeys($keywords)

# Click on the submit button
$submitButton = $driver.FindElementById("submit")
$submitButton.Click()
Start-Sleep -Seconds 3