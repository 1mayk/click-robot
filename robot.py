from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# url = "https://clickhelp.org/me/cliente"
url = "https://clickhelp-sandbox.vercel.app/me/cliente"

driver = webdriver.Chrome()

while True:
    driver.get(url)

    email_input = driver.find_element(By.ID, "email")
    email_input.send_keys("maycon.lrgo@gmail.com")

    password_input = driver.find_element(By.ID, "password")
    password_input.send_keys("12345678")

    login_button = driver.find_element(By.CLASS_NAME, "enter__login")
    login_button.click()

    print("click")

    time.sleep(300)

driver.quit()
