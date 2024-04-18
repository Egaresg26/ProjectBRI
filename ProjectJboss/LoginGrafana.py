import requests

def login(username, password):
    url = 'https://confluence.bri.co.id/login.action?os_destination=%2Fpages%2Fviewpage.action%3FspaceKey%3DIAO2023%26title%3DAll%2BAplikasi%2BIAO&permissionViolation=true'
    data = {
        'username': username,
        'password': password
    }
    
    response = requests.post(url, data=data)

    # Jika respons status code 200, maka login berhasil
    if response.status_code == 200:
        print("Login berhasil!")
        # Jika ada sesuatu yang ingin Anda lakukan setelah login berhasil, tambahkan di sini
    else:
        print("Login gagal. Status code:", response.status_code)

# Ganti dengan username dan password yang sesuai
username = '90171615'
password = 'fe2c97HaF3eeX88E'

login(username, password)