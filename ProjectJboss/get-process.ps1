# Mendapatkan daftar proses yang sedang berjalan
$runningProcesses = Get-Process

# Melihat judul jendela untuk setiap proses
foreach ($process in $runningProcesses) {
    $mainWindowTitle = $process.MainWindowTitle
    if ($mainWindowTitle -ne '') {
        Write-Output "Nama Proses: $($process.Name), Judul Jendela: $mainWindowTitle"
    }
}
