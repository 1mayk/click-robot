FROM python:3.12

# Instale as dependências necessárias
RUN apt-get update && apt-get -y install wget curl unzip gnupg

# Adicione o repositório do Google Chrome e sua chave
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

# Instale o Google Chrome
RUN apt-get update && apt-get -y install google-chrome-stable

# Baixe e instale o ChromeDriver manualmente
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip -P / && \
    unzip /chromedriver_linux64.zip -d / && \
    chmod +x /chromedriver && \
    mv -f /chromedriver /usr/local/share/ && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do aplicativo
COPY . .

# Instale as dependências Python
RUN pip install -r requirements.txt

# Inicie o aplicativo
CMD ["python", "robot.py"]
