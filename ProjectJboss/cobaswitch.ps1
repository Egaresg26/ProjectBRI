# Cek apakah tipe WinApi sudah ada sebelumnya
if (-not ([System.Management.Automation.PSTypeName]'WinApi').Type) {
    # Tipe WinApi belum ada, maka tambahkan definisi tipe
    Add-Type @"
        using System;
        using System.Runtime.InteropServices;
        public class WinApi {
            [DllImport("user32.dll")]
            [return: MarshalAs(UnmanagedType.Bool)]
            public static extern bool SwitchToThisWindow(IntPtr hWnd, bool fAltTab);
        }
"@
}

# Cari proses dengan nama "powershell" dan judul jendela "Administrator: Windows PowerShell"
$windowProcess = Get-Process | Where-Object { $_.ProcessName -eq "powershell" -and $_.MainWindowTitle -eq "Administrator: Windows PowerShell" }

if ($windowProcess -ne $null) {
    # Dapatkan handle jendela
    $windowHandle = $windowProcess.MainWindowHandle

    # Beralih ke jendela menggunakan fungsi Win32 API
    [WinApi]::SwitchToThisWindow($windowHandle, $true)

    # Tambahkan penundaan sejenak untuk memastikan beralih jendela selesai
    Start-Sleep -Seconds 5

    # Kirimkan perintah ping menggunakan SendKeys
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.SendKeys]::SendWait("ping google.com -t")
} else {
    Write-Host "Jendela 'Administrator: Windows PowerShell' tidak ditemukan."
}
