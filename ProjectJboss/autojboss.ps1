# Jalankan file batch menggunakan Invoke-Item (ini akan membuka file batch dalam jendela CMD yang terpisah)
Invoke-Item -Path ".\LoginT24.py"
Start-Sleep -Seconds 5
Invoke-Item -Path ".\ping.bat"
Start-Sleep -Seconds 5
Invoke-Item -Path ".\Run.bat"

# Tunggu beberapa detik agar jendela CMD selesai dimuat

Start-Sleep -Seconds 2

# Temukan jendela CMD yang terbuka
$cmdWindow = Get-Process | Where-Object { $_.MainWindowTitle -like ".\Run.bat" }

# Aktifkan jendela CMD
Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.SendKeys]::SendWait("2{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")