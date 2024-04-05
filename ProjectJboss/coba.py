import subprocess
import time

# Buka jendela Command Prompt
subprocess.Popen("cmd.exe", shell=True)

# Tunggu beberapa detik agar jendela CMD selesai dimuat
time.sleep(2)

# Kirimkan perintah ke jendela CMD yang terbuka
#subprocess.run("echo 2", shell=True)
#time.sleep(5)

# Kirimkan perintah ping google.com ke jendela CMD yang terbuka
subprocess.run("ping google.com -t", shell=True)
