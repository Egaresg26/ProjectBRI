import subprocess
import pyautogui
import time

# Definisikan username dan password di dalam skrip Python
username = "Semua"
password = "Lu@1213I4sA"

# Path ke file batch
batch_file_path = "C:/Users/user/Documents/ProjectBRI/coba.bat"

# Jalankan file batch dengan username dan password sebagai argumen
subprocess.call([batch_file_path, username, password])

# Tunggu sebentar sebelum menekan tombol
time.sleep(2)

# Mengirimkan kombinasi tombol Ctrl+V
pyautogui.hotkey('ctrl', 'v')

# Tunggu sebentar sebelum menekan tombol
time.sleep(1)

# Mengirimkan kombinasi tombol Ctrl+U
pyautogui.hotkey('ctrl', 'u')

# Tunggu sebentar sebelum menekan tombol
time.sleep(1)

# Mengirimkan tombol Enter
pyautogui.press('enter')
