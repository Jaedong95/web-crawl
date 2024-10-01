FROM pytorch/pytorch:latest
WORKDIR /crawl
COPY . .

RUN apt-get update -y
RUN apt-get install python3-pip -y

RUN apt-get install wget -y 
RUN apt-get install curl -y 
RUN apt-get install gnupg -y
RUN apt-get install vim -y 

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y

RUN apt-get update && apt-get install -y wget \
    && wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y \
    && apt-get install -y google-chrome-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm google-chrome-stable_current_amd64.deb

RUN pip install -r requirements.txt
