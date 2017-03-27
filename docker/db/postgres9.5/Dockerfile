FROM postgres:9.5

RUN mkdir /dump
ADD init/db-init.sql /docker-entrypoint-initdb.d/
ADD dump/import_dump.sh /