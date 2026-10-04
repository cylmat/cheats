## Sql  
```
psql -U postgres -c "CREATE DATABASE keycloak;";
psql -U postgres keycloak < ./data/keycloak/keycloak.pgsql
```

## Dump  
```
pg_dump -U postgres keycloak > ./data/keycloak/keycloak.pgsql
```

## Grant user
```
 CREATE USER sites_u WITH ENCRYPTED PASSWORD 'sites_p';
    CREATE DATABASE sites_db;
    ALTER DATABASE sites_indus_db OWNER TO sites_u;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO sites_u;
    GRANT ALL PRIVILEGES ON DATABASE sites_db TO site_u;
    GRANT ALL ON DATABASE sites_db TO sites_u;
```

## WITH as a parallele select and JSON

- WITH aggregated values 
- COALESCE(subjects.subjects, '[]'::jsonb) AS subjects
```
WITH aggregated_values AS ( 
        SELECT
            grouped_subject.id AS grouped_subject_id,
            grouped_subject.code AS grouped_subject_code,
            DATE_TRUNC('month', iv.date_time_immutable AT TIME ZONE 'UTC') AS month_start,
            SUM(COALESCE(iv.value_float, 0)) AS value_float
        FROM indicator_value iv
            LEFT JOIN industrial_site_indicator isi ON isi.id = iv.industrial_site_indicator_id
            LEFT JOIN indicator_subject grouped_subject           ON grouped_subject.id = ivis.indicator_subject_id
        WHERE iss.id = :industrialSiteId
            AND grouped_subject.value IS NOT NULL
        GROUP BY
            grouped_subject.id, grouped_subject.code, grouped_subject.label, grouped_subject.value,
            grouped_subject_type.code, grouped_subject_type.name,
            DATE_TRUNC('month', iv.date_time_immutable AT TIME ZONE 'UTC')
)

            SELECT av.*, COALESCE(subjects.subjects, '[]'::jsonb) AS subjects
            FROM aggregated_values av

            LEFT JOIN LATERAL (
                SELECT jsonb_agg(
                DISTINCT jsonb_build_object(
                    'code', s.code,
                    'label', s.label,
                    'value', s.value,
                    'indicatorSubjectType', jsonb_build_object(
                        'code', st.code,
                        'name', st.name
                    )
                )
            ) AS subjects
                FROM indicator_value iv2
                    LEFT JOIN indicator_value_indicator_subject ivis_group  ON ivis_group.indicator_value_id = iv2.id
                    LEFT JOIN indicator_value_indicator_subject ivis_all    ON ivis_all.indicator_value_id = iv2.id
                WHERE iv2.industrial_site_indicator_id = av.industrial_site_indicator_id
                    AND DATE_TRUNC('month', iv2.date_time_immutable AT TIME ZONE 'UTC') = av.month_start
                    AND ivis_group.indicator_subject_id = av.grouped_subject_id
            ) subjects ON true
```

## Sample SQL
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
