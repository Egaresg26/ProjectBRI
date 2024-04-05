# Jalankan file batch menggunakan Invoke-Item (ini akan membuka file batch dalam jendela CMD yang terpisah)
# Invoke-Item -Path ".\LoginT24.py"
# Start-Sleep -Seconds 5
# Invoke-Item -Path ".\ping.bat"
# Start-Sleep -Seconds 5
# Jalankan file batch
Invoke-Item -Path ".\Run.bat"

# Tunggu beberapa detik agar jendela CMD selesai dimuat
Start-Sleep -Seconds 2

# Temukan jendela CMD yang terbuka
$cmdWindow = Get-Process | Where-Object { $_.MainWindowTitle -eq "C:\Windows\system32\cmd.exe" }

# Aktifkan jendela CMD
if ($cmdWindow -ne $null) {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.SendKeys]::SendWait("2{ENTER}")
} else {
    Write-Host "Jendela CMD tidak ditemukan."
}

# Tunggu beberapa detik
Start-Sleep -Seconds 5

# Temukan jendela CMD lagi (diasumsikan sekarang menjadi "Administrator: Command Prompt")
$cmdWindow = Get-Process | Where-Object { $_.MainWindowTitle -eq "Administrator: Command Prompt" }

# Kirimkan perintah untuk melakukan ping ke google.com secara terus-menerus
if ($cmdWindow -ne $null) {
    [System.Windows.Forms.SendKeys]::SendWait(" ping google.com -t{ENTER}")
} else {
    Write-Host "Jendela Administrator: Command Prompt tidak ditemukan."
}
