#STOP TSA SERVICE
# buka file trun.bat
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

Start-Process -FilePath .\quit.bat -Verb RunAs
Add-Type -AssemblyName System.Windows.Forms
Start-Sleep -Seconds 3

#LOGIN
#username
[System.Windows.Forms.SendKeys]::SendWait("username{ENTER}")
Start-Sleep -Seconds 3
#password
[System.Windows.Forms.SendKeys]::SendWait("passwor{ENTER}")
Start-Sleep -Seconds 3

#masuk cabang SGP
[System.Windows.Forms.SendKeys]::SendWait("SGP{ENTER}")
Start-Sleep -Seconds 3

#Mulai stop TSA service
[System.Windows.Forms.SendKeys]::SendWait("TS, I TSM{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("6{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("STOP{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("^V{ENTER}") 

Start-Sleep -Seconds 3

#kembali ke menu utama
[System.Windows.Forms.SendKeys]::SendWait("^u{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("^u{ENTER}")
Start-Sleep -Seconds 3

# Tunggu beberapa detik agar jendela CMD selesai dimuat
Start-Sleep -Seconds 5

#STOP JBOSS
#Get-Process | Where-Object { $_.MainWindowTitle -ne "" } | Select-Object MainWindowTitle

$windowName = "Administrator: Command Prompt - ping  google.com -t"
$windowProcess = Get-Process | Where-Object { $_.MainWindowTitle -eq $windowName }
$windowHandle = $windowProcess.MainWindowHandle
[WinApi]::SwitchToThisWindow($windowHandle, $true)

# Kirimkan perintah ping
#[System.Windows.Forms.SendKeys]::SendWait(" ping google.com -t{ENTER}")

Start-Sleep -Seconds 10

# Mengirimkan input Ctrl+C untuk menghentikan ping
[System.Windows.Forms.SendKeys]::SendWait(" ^c")
