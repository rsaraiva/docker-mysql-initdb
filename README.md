# docker-mysql-initdb
MySQL docker image with init database/scripts

## Usage

#### Clone the project

`git clone https://github.com/rsaraiva/docker-mysql-initdb.git`

#### Edit init.sql file

```
cd docker-mysql-initdb
vim init.sql
```

#### Build the image

`docker build -t docker-mysql-initdb ./`

#### Run the container

`docker run -d --name mysql-initdb -p 3306:3306 docker-mysql-initdb`

#### Connect and be happy!

```
INITDB_HOST=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' mysql-initdb`

mysql -h $INITDB_HOST -u root
```


