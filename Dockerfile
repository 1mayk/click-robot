FROM python:3.12

RUN apt-get update && apt-get -y install wget curl unzip && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get -y install google-chrome-stable && \
    wget -N https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip -P / && \
    unzip /chromedriver_linux64.zip -d / && \
    chmod +x /chromedriver && \
    mv -f /chromedriver /usr/local/share/ && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /chromedriver_linux64.zip


WORKDIR /app

COPY robot.py .

RUN pip install -r requirements.txt

CMD ["python", "robot.py"]
