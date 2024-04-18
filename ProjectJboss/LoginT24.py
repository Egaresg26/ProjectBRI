from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import time

# usr n pass
username = "90171626"
password = "0ef8Z4J5d00V51cW"

# initialize the Chrome driver
options = webdriver.EdgeOptions()

options.add_experimental_option("detach", True)

driver = webdriver.Edge(options=options)

# Confluence Login page
driver.get("https://172.18.134.83:8443/BSGUAT/servlet/BrowserServlet")
time.sleep(5)
driver.find_element("id", "details-button").click()
time.sleep(3)
driver.find_element("id", "proceed-link").click()
time.sleep(3)
# find username/email field and send the username itself to the input field
driver.find_element("id", "signOnName").send_keys(username)
time.sleep(3)
# find password input field and insert password as well
driver.find_element("id", "password").send_keys(password)
time.sleep(3)
# click login button
driver.find_element("id", "sign-in").click()
time.sleep(3)
# wait the ready state to be complete
# WebDriverWait(driver=driver, timeout=10).until(
#     lambda x: x.execute_script("return document.readyState === 'complete'")
# )
time.sleep(3)
error_message = "Incorrect username or password."
# get the errors (if there are)
errors = driver.find_elements("css selector", ".flash-error")
# print the errors optionally
# for e in errors:
#     print(e.text)
# if we find that error message within errors, then login is failed
if any(error_message in e.text for e in errors):
    print("[!] Login failed")
else:
    print("[+] Login successful")
