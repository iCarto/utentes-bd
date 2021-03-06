-- Deploy utentes:create_view_domains to pg
-- requires: create_schema_domains

BEGIN;

CREATE OR REPLACE VIEW domains.domains AS
SELECT category, key, value, ordering, parent, tooltip FROM domains.ara
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.actividade
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.animal_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.bacia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.contador
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.cultivo_tipo
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.distrito a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-distrito', key, value, ordering, parent, tooltip FROM domains.distrito
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.energia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.fonte_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.industria_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_estado
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.pagamentos
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.boolean
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.posto a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-posto', key, value, ordering, parent, tooltip FROM domains.posto
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.provincia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.rega_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.subacia
;

-- ALTER VIEW domains.domains OWNER TO utentes;
COMMIT;
