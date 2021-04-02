FROM mysql:5.7

# change this default root password using deployment time environment var
ENV MYSQL_ROOT_PASSWORD=testrootpass

#copy sql file into image
COPY ./Create.sql /docker-entrypoint-initdb.d
#add sql file into image
ADD ./Create.sql /docker-entrypoint-initdb.d