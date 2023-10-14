FROM python:3.12

# Instale as dependências necessárias
RUN apt-get update && apt-get -y install wget curl unzip gnupg

# Adicione o repositório do Google Chrome e sua chave
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

# Instale o Google Chrome e o ChromeDriver
RUN apt-get update && apt-get -y install google-chrome-stable chromium-chromedriver

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do aplicativo
COPY . .

# Instale as dependências Python
RUN pip install -r requirements.txt

# Inicie o aplicativo
CMD ["python", "robot.py"]
