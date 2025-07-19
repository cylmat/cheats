Sql  
```
psql -U postgres -c "CREATE DATABASE keycloak;";
psql -U postgres keycloak < ./data/keycloak/keycloak.pgsql
```

Dump  
```
pg_dump -U postgres keycloak > ./data/keycloak/keycloak.pgsql
```

Sample SQL
```
 WITH cabinet_paths AS (
    SELECT
        c.id AS cabinet_id,
        c.tree_id,
        c.label AS cabinet_name,
        (
            SELECT STRING_AGG(ancestor.label, '/' ORDER BY ancestor.level)
            FROM public.cabinets_cabinet ancestor
            WHERE ancestor.tree_id = c.tree_id
              AND ancestor.lft <= c.lft
              AND ancestor.rght >= c.rght
        ) AS full_path
    FROM public.cabinets_cabinet c
),
file_locations AS (
    SELECT
        df.id AS file_id,
        df.filename,
        df.document_id
    FROM public.documents_documentfile df
    JOIN public.documents_document dd ON df.document_id = dd.id
    WHERE dd.in_trash = false
)
SELECT DISTINCT full_path, filename
FROM file_locations
WHERE full_path LIKE 'espace-Evo%'
ORDER BY full_path, filename;
```

@https://www.crunchydata.com/developers/playground  
@https://www.crunchydata.com/developers/tutorials  
