FROM node:7.2.1-wheezy

#copy and launch code
RUN mkdir -p /app
COPY . /app
RUN ls -l /app
RUN npm install /app

#CMD tail -f /dev/null
CMD /app/launch.sh


EXPOSE 80
