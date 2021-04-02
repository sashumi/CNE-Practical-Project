FROM mysql:5.7

#copy sql file into image
COPY ./Create.sql /docker-entrypoint-initdb.d
#add sql file into image
ADD ./Create.sql /docker-entrypoint-initdb.d