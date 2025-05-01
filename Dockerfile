FROM node:18
#RUN apt-get update && apt-get install -y build-essential
#RUN wget https://github.com/google/toktx/releases/download/v1.0.0/toktx-linux-64.zip
#RUN unzip toktx-linux-64.zip -d /usr/local/bin
#RUN chmod +x /usr/local/bin/toktx

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/KhronosGroup/KTX-Software/releases/download/v4.2.1/KTX-Software-4.2.1-Linux-x86_64.deb
RUN dpkg -i KTX-Software-4.2.1-Linux-x86_64.deb

#RUN chmod +x /usr/local/bin/toktx
#ENV PORT 4000
#ENV API_KEY ZaqFpkz9l1BNlaH60HpmNqSE2xNhVagf
#ENV UPLOAD_ENDPOINT http://20.244.4.185:4800/UploadFile


WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 9003

CMD [ "npm", "start" ]
