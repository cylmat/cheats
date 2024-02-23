Sql  
```plu
psql -U postgres -c "CREATE DATABASE keycloak;";
psql -U postgres keycloak < ./data/keycloak/keycloak.pgsql
```

Dump  
```
pg_dump -U postgres keycloak > ./data/keycloak/keycloak.pgsql
```

@https://www.crunchydata.com/developers/playground
@https://www.crunchydata.com/developers/tutorials
