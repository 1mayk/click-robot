# click-robot

## 1 - Criar um ambiente virtual para instalar bibliotecas

    python3 -m venv .venv

## 2 - Acessar ambiente

     source .venv/bin/activate

## 3 - Verificar se está dentro do ambiente virtual

    which python3

>Deve retornar algo como:

    /home/seu_user/desktop/click-robot/.venv/bin/python3

## 4 - Instalar bibliotecas

    pip install -r requirements.txt

## 5 - Rodar robô

    python3 -u robot.py