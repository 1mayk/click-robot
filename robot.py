import requests
from bs4 import BeautifulSoup
import time

url = "https://clickhelp.org/me/cliente"

session = requests.Session()

while True:
    # Fazer uma solicitação GET para a página
    response = session.get(url)

    # Verificar se a solicitação foi bem-sucedida
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")

        # Encontrar o campo de email pelo ID
        email_input = soup.find("input", {"id": "email"})
        if email_input:
            email_input_value = email_input["value"]
            email_input_value = "maycon.lrgo@gmail.com"

        # Encontrar o campo de senha pelo ID
        password_input = soup.find("input", {"id": "password"})
        if password_input:
            password_input_value = password_input["value"]
            password_input_value = "12345678"

        # Encontrar o botão de login pela classe
        login_button = soup.find("button", {"class": "enter__login"})
        if login_button:
            # Fazer uma solicitação POST para o formulário de login
            form_data = {
                "email": email_input_value,
                "password": password_input_value,
            }
            login_url = "https://clickhelp.org/me/login"  # URL de login
            response = session.post(login_url, data=form_data)

            if response.status_code == 200:
                print("Login bem-sucedido.")
            else:
                print("Falha no login.")

    print("click")

    # Esperar 300 segundos (5 minutos)
    time.sleep(300)
