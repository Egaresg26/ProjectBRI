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

#invoke python