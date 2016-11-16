# API documentation !

display API doc using react and express

Build from :
https://codingbox.io/react-for-beginners-part-1-setting-up-repository-babel-express-web-server-webpack-a3a90cc05d1e#.28541ssvl








# Docker part

Install Mysql docker using docker compose:

  $ docker-compose up

The first time, you'll need to create the db:

  $ mysql -h 127.0.0.1 -u root -proot -e "create database api_doc"

You can inject table in DB:

  $ mysql -h 127.0.0.1 -u root -proot "api_doc" < /tmp/create_db.sql
