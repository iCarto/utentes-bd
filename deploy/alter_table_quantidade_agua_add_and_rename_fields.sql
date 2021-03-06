-- Deploy utentes:alter_table_quantidade_agua_add_and_rename_fields to pg

BEGIN;

ALTER TABLE inventario.quantidade_agua RENAME COLUMN data TO data_ens;
ALTER TABLE inventario.quantidade_agua RENAME COLUMN hora TO hora_ens;

ALTER TABLE inventario.quantidade_agua ADD COLUMN n_estatic numeric(10,2);
ALTER TABLE inventario.quantidade_agua ADD COLUMN n_freatic numeric(10,2);
ALTER TABLE inventario.quantidade_agua ADD COLUMN n_semi_co numeric(10,2);
ALTER TABLE inventario.quantidade_agua ADD COLUMN q_extraer numeric(10,2);

ALTER TABLE inventario.quantidade_agua ALTER COLUMN data_ens DROP NOT NULL;
ALTER TABLE inventario.quantidade_agua ALTER COLUMN nivel_agua DROP NOT NULL;
ALTER TABLE inventario.quantidade_agua ALTER COLUMN prof_campo DROP NOT NULL;

ALTER TABLE inventario.quantidade_agua ALTER COLUMN cadastro TYPE character varying(254);


COMMIT;
