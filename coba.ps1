# Mendapatkan daftar situs web yang ada di IIS Manager
$sites = Get-Website

# Fungsi untuk memeriksa status situs web dan memulai ulang jika diperlukan
function CheckAndRestartWebsite {
    param(
        [string]$websiteName
    )

    $website = Get-Website $websiteName
    if ($website.State -ne "Started") {
        Write-Host "Situs web $websiteName sedang tidak berjalan. Memulai ulang situs web..."
        Start-Website $websiteName
        Write-Host "Situs web $websiteName telah dimulai ulang."
    } else {
        Write-Host "Situs web $websiteName sedang berjalan dengan baik."
    }
}

# Memanggil fungsi CheckAndRestartWebsite untuk setiap situs web
foreach ($site in $sites) {
    CheckAndRestartWebsite -websiteName $site.Name
}
