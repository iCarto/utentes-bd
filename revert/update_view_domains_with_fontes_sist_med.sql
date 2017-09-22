-- Revert utentes:update_view_domains_with_fontes_sist_med from pg

BEGIN;

DROP MATERIALIZED VIEW domains.domains;

COMMIT;
