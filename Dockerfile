# Use a imagem base do Python
FROM python:3.12

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do aplicativo
COPY . .

# Instale as dependências Python
RUN pip install -r requirements.txt

# Defina o comando para executar o script
CMD ["python", "robot.py"]
