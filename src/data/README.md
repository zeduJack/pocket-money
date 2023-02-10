# Create local DB with default "postgres" user and database
docker volume create pocket-money-pgdata
docker run --name pocket-money -p 5456:5432 -v pocket-money-pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD="mas9i4kr&fkr4i*" -d postgres
