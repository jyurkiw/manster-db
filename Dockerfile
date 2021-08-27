FROM postgres:alpine
ADD ./schema.sql /root/
RUN mv /root/schema.sql /docker-entrypoint-initdb.d/schema.sql
RUN echo "host    all             all                0.0.0.0/32            trust" >> /var/lib/postgresql/data/pghba.conf