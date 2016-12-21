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

# To do

. add a default page
. manage application as a docker
. apply flux architecture
. manage authentication
. manage edition in line







### Docker management

# Run by hand

docker run --name apidoc_db_1 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=api_doc -e MYSQL_USER=root -p 3306:3306 -v ~/workspace/api_doc/.data/db:/var/lib/mysql -d mysql:5.7.16
docker build . --tag api-doc-server:1.0
docker run -e NODE_ENV=production -d -p 3000:3000 --link apidoc_db_1 api-doc-server:1.0

