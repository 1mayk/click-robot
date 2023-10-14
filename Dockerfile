FROM python:3.10

# Defina o diretório de trabalho
WORKDIR /app

# Instale as dependências Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# Instale o Cypress
RUN npm install cypress

# Copie os arquivos do aplicativo
COPY . .

# Inicie o aplicativo
CMD ["python", "robot.py"]
