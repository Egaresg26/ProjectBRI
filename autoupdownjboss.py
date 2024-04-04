import os
import time
import pyautogui

def stop_services():
    # Step 1-6: Stop TSM
    os.system("start D:\\Temenos\\env\\BTWPROD\\tRun.bat")
    time.sleep(5)  # Menunggu aplikasi terbuka
    pyautogui.typewrite("T24\n")  # Step 2: Masukkan User T24
    pyautogui.typewrite("password\n")  # Step 3: Masukkan Password T24
    time.sleep(5)
    pyautogui.typewrite("TS, I TSM 6 STOP\n")  # Step 4: Jalankan perintah TS, I TSM 6 STOP
    time.sleep(2)
    pyautogui.hotkey('ctrl', 'v')  # Step 4: Paste clipboard
    pyautogui.press('enter')
    time.sleep(2)
    pyautogui.hotkey('ctrl', 'u')  # Step 5: Balik ke Menu utama
    pyautogui.press('enter')
    pyautogui.hotkey('ctrl', 'u')
    pyautogui.press('enter')
    pyautogui.typewrite("LO\n")  # Step 6: Logout dari T24
    pyautogui.press('enter')
    pyautogui.typewrite("exit\n")  # Step 6: Close session trun

    # Step 7-8: Stop JBoss
    os.system("start D:\\Temenos\\env\\BTWPROD\\jbossBTWPROD.bat")
    time.sleep(10)  # Menunggu aplikasi terbuka
    pyautogui.hotkey('ctrl', 'c')  # Step 7: Stop JBoss
    time.sleep(2)
    pyautogui.press('enter')  # Konfirmasi dengan menekan enter
    time.sleep(2)
    pyautogui.typewrite("Y\n")  # Pilih Y untuk close session command prompt Jboss

def start_services():
    # Step 1-6: Start TSM
    os.system("start D:\\Temenos\\env\\BTWPROD\\tRun.bat")
    time.sleep(5)  # Menunggu aplikasi terbuka
    pyautogui.typewrite("T24\n")  # Step 2: Masukkan User T24
    pyautogui.typewrite("password\n")  # Step 3: Masukkan Password T24
    time.sleep(5)
    pyautogui.typewrite("TS, I TSM 6 START\n")  # Step 4: Jalankan perintah TS, I TSM 6 START
    time.sleep(2)
    pyautogui.hotkey('ctrl', 'v')  # Step 4: Paste clipboard
    pyautogui.press('enter')
    time.sleep(2)
    pyautogui.hotkey('ctrl', 'u')  # Step 5: Balik ke Menu utama
    pyautogui.press('enter')
    pyautogui.hotkey('ctrl', 'u')
    pyautogui.press('enter')
    pyautogui.typewrite("LO\n")  # Step 6: Logout dari T24
    pyautogui.press('enter')
    pyautogui.typewrite("exit\n")  # Step 6: Close session trun

    # Step 8-10: Start JBoss
    os.system("start D:\\Temenos\\env\\BTWPROD\\jbossBTWPROD.bat")
    time.sleep(60)  # Menunggu aplikasi terbuka
    pyautogui.typewrite("START.TSM\n")  # Step 9: Jalankan perintah START.TSM
    time.sleep(5)
    pyautogui.alert(text='Press OK when JBoss is fully started', title='JBoss Started', button='OK')  # Tunggu hingga JBoss up
    pyautogui.alert(text='Press Yes when prompted to start TSM', title='Start TSM', button='Yes')  # Tekan Yes pada pop-up

if __name__ == "__main__":
    stop_services()
    start_services()
