# Jalankan file batch menggunakan Invoke-Item (ini akan membuka file batch dalam jendela CMD yang terpisah)
#Invoke-Item -Path ".\LoginT24.py"
#Start-Sleep -Seconds 5
# Invoke-Item -Path ".\ping.bat"
# Start-Sleep -Seconds 5
# Jalankan file batch
Start-Process -FilePath .\Run.bat -Verb RunAs

# Tunggu beberapa detik agar jendela CMD selesai dimuat
Start-Sleep -Seconds 5

# Temukan jendela CMD yang terbuka
#$cmdWindow = Get-Process | Where-Object { $_.MainWindowTitle -eq "C:\Windows\system32\cmd.exe"}


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("2{ENTER}")

# Tunggu beberapa detik
Start-Sleep -Seconds 5

# Temukan jendela CMD lagi (diasumsikan sekarang menjadi "Administrator: Command Prompt")
#$cmdWindow = Get-Process | Where-Object { $_.MainWindowTitle -eq "Administrator: Command Prompt" }

# Kirimkan perintah untuk melakukan ping ke google.com secara terus-menerus

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Dapatkan jendela aktif
#$activeWindow = [System.Windows.Application]::Current.Windows | Where-Object { $_.IsActive }
$activeWindow.WindowState = [System.Windows.WindowState]::Minimized

[System.Windows.Forms.SendKeys]::SendWait(" ping google.com -t{ENTER}")

Start-Sleep -Seconds 5

[System.Windows.Forms.SendKeys]::SendWait(" ^c")
