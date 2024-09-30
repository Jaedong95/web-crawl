FROM pytorch/pytorch:latest
WORKDIR /crawl  
COPY . .

ENV LC_ALL ko_KR.UTF-8 
RUN apt-get update && apt-get install -y locales
RUN locale-gen ko_KR.UTF-8   
RUN apt-get install python3-pip -y

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates \
    --no-install-recommends

# Google Chrome 설치
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || true \
    && apt-get update \
    && apt-get -fy install \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm google-chrome-stable_current_amd64.deb

RUN pip install -r requirements.txt