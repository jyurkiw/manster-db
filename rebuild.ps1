docker stop mansterdb
docker rm mansterdb
docker volume rm manster-data
docker volume create manster-data
docker rmi mansterapi-db:t1
docker build . -t mansterapi-db:t1
docker run -it -d -v manster-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=admin123 -e POSTGRES_USER=manster -e POSTGRES_DB=manster --name mansterdb mansterapi-db:t1
docker cp .\schema.sql mansterdb:/root/schema.sql