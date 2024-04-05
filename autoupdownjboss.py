import subprocess
import pyautogui
import time

# Fungsi untuk menjalankan Run.bat
def run_ega():
    batch_file_path = r".\Run.bat"
    subprocess.Popen([batch_file_path], shell=True)
    print("File batch Run.bat berhasil dibuka.")

    # Menunggu sebentar agar jendela CMD untuk Run.bat terbuka
    time.sleep(3)

    # Menulis '1' dan menekan Enter
    pyautogui.press('2')
    pyautogui.press('enter')
    
    time.sleep(10)

# Fungsi untuk menjalankan testing.bat
def run_dode():
    batch_file_path2 = r".\testing.bat"
    subprocess.Popen([batch_file_path2], shell=True)

    # Menunggu sebentar agar jendela CMD untuk testing.bat terbuka
    time.sleep(3)

    # Menulis 'exit' dan menekan Enter untuk keluar dari jendela CMD
    pyautogui.typewrite('exit')
    pyautogui.press('enter')


# Memanggil kedua fungsi secara bersamaan
run_ega()

run_dode()
