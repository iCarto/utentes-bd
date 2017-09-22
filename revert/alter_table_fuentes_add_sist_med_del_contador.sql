-- Revert utentes:alter_table_fuentes_add_sist_med_del_contador from pg

BEGIN;

-- Recreate the table contador
CREATE TABLE domains.contador (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- Repopulate the table contador
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', NULL, NULL, 0, NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Existe', 'true', 1, NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Não existe', 'false', 2, NULL, NULL);

-- Add column contador to fontes
ALTER TABLE utentes.fontes
    ADD COLUMN contador boolean;

-- Recover the content of column contador from others columns content
UPDATE utentes.fontes
    SET contador = (
        CASE
            WHEN sist_med='Contador' THEN TRUE
            WHEN lat_lon IS NULL AND d_dado IS NULL THEN NULL
            ELSE FALSE
        END
    );

-- Set to NULL the column sist_med to all rows
UPDATE utentes.fontes
    SET sist_med = NULL
    WHERE sist_med IS NOT NULL;

-- Drop the column sist_med
ALTER TABLE utentes.fontes
    DROP COLUMN sist_med;

-- Delete the table fontes_sist_med
DROP TABLE domains.fontes_sist_med;

COMMIT;
