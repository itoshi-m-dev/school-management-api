FROM python:3.13.5-alpine3.22

# 1. Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# 2. Copiar o arquivo de dependências primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# 3. Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar o restante do código da aplicação
COPY . .

# 5. Expor a porta em que a aplicação será executada
EXPOSE 8000

# 6. Definir o comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
