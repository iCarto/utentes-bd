-- Deploy utentes:alter_table_fuentes_add_sist_med_del_contador to pg

BEGIN;

-- Create table fontes_sist_med
CREATE TABLE domains.fontes_sist_med (
    key TEXT PRIMARY KEY,
    category TEXT,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- Add data to table fontes_sist_med
INSERT INTO domains.fontes_sist_med VALUES ('Contador', 'sistema_medicao');
INSERT INTO domains.fontes_sist_med VALUES ('Dotação', 'sistema_medicao');
INSERT INTO domains.fontes_sist_med VALUES ('Medidor Hidráulico', 'sistema_medicao');
INSERT INTO domains.fontes_sist_med VALUES ('Volumétrica', 'sistema_medicao');

-- Add column to fontes
ALTER TABLE utentes.fontes
    ADD COLUMN sist_med TEXT references domains.fontes_sist_med(key);

-- Update column sist_med to existent data
UPDATE utentes.fontes
    SET sist_med = 'Contador'
    WHERE contador=TRUE;

-- Delete column contador from table fontes
ALTER TABLE utentes.fontes
    DROP COLUMN contador;

-- Delete table domains.contador
DROP table domains.contador;

COMMIT;
