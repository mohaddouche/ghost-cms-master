FROM debian:9

RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/ftp.debian.org\/debian/' /etc/apt/sources.list \
    && apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && . ~/.nvm/nvm.sh \
    && nvm install 10 \
    && apt-get clean -y

ADD . /app/
WORKDIR /app
RUN npm install

EXPOSE 2368
VOLUME /app/logs

CMD npm run start


