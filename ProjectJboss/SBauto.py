import subprocess
import pygetwindow as gw
import pyautogui
import time

# Membuka file batch menggunakan subprocess
process = subprocess.Popen(["cmd", "/k", "start", "Run.bat"])

# Menunggu beberapa saat agar jendela CMD terbuka sepenuhnya
time.sleep(2)

# Mencari jendela CMD yang terbuka
cmd_window = gw.getWindowsWithTitle('cmd')[0]

# Mengaktifkan jendela CMD
cmd_window.activate()

# Mengetikkan "1" menggunakan pyautogui
pyautogui.typewrite('2')
pyautogui.press('enter')
