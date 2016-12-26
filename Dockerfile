FROM node:7.2.1-wheezy

RUN mkdir -p /app
COPY . /app
RUN ls -l /app
RUN npm install /app

CMD /app/launch.sh

EXPOSE 80
