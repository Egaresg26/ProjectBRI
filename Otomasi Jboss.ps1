$batchFilePath = ".\Run.bat"

if (Test-Path $batchFilePath) {
    # Buka file batch dengan Invoke-Item
    Invoke-Item $batchFilePath
    Write-Host "File batch berhasil dibuka."

    # Tunggu sebentar agar file batch terbuka sepenuhnya
    Start-Sleep -Seconds 1
    
    # Simpan nilai 1 ke dalam variabel choice dengan menggunakan echo dan pipe ke set /p
    Add-Content -Path $batchFilePath -Value "`n(echo 1) | set /p choice=`r`n" -Encoding ASCII
    Write-Host "Nilai 1 berhasil ditulis ke dalam file batch."

    # Simulasikan penekanan tombol Enter
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Write-Host "Tombol Enter ditekan."
} else {
    Write-Host "File batch tidak ditemukan di lokasi yang ditentukan: $batchFilePath"
}
