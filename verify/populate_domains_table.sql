-- Verify utentes:populate_domains_table on pg

BEGIN;

SELECT 1/COUNT(*) FROM domains.actividade;
SELECT 1/COUNT(*) FROM domains.animal_tipo;
SELECT 1/COUNT(*) FROM domains.distrito;
SELECT 1/COUNT(*) FROM domains.energia_tipo;
SELECT 1/COUNT(*) FROM domains.fonte_tipo;
SELECT 1/COUNT(*) FROM domains.industria_tipo;
SELECT 1/COUNT(*) FROM domains.licencia_estado;
SELECT 1/COUNT(*) FROM domains.licencia_tipo;
SELECT 1/COUNT(*) FROM domains.pagamentos;
SELECT 1/COUNT(*) FROM domains.posto;
SELECT 1/COUNT(*) FROM domains.provincia;
SELECT 1/COUNT(*) FROM domains.subacia;
SELECT 1/COUNT(*) FROM domains.bacia;
SELECT 1/COUNT(*) FROM domains.rega_tipo;
SELECT 1/COUNT(*) FROM domains.contador;
SELECT 1/COUNT(*) FROM domains.cultivo_tipo;

ROLLBACK;
