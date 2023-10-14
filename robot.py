import requests
from bs4 import BeautifulSoup
import time

url = "https://clickhelp.org/me/cliente"
session = requests.Session()

# Dados de login
email = "maycon.lrgo@gmail.com"
password = "12345678"

while True:
    # Fazer uma solicitação GET para a página
    response = session.get(url)

    # Verificar se a solicitação foi bem-sucedida
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")

        # Encontrar os campos de email e senha
        email_input = soup.find("input", {"id": "email"})
        password_input = soup.find("input", {"id": "password"})

        if email_input and password_input:
            # Extrair os valores dos campos (se necessário)
            email_input["value"] = email
            password_input["value"] = password

            # Encontrar o botão de login pela classe
            login_button = soup.find("button", {"class": "enter__login"})

            if login_button:
                # Fazer uma solicitação POST para o próprio URL da página
                form_data = {
                    "email": email,
                    "password": password,
                }
                response = session.post(url, data=form_data)

                if response.status_code == 200:
                    print("Login bem-sucedido.")
                else:
                    print("Falha no login.")

    print("click")

    # Esperar 300 segundos (5 minutos)
    time.sleep(300)
