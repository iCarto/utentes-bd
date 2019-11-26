# Actualizar BD del ARAN

El proceso de actualizar la base de datos del ARAN al último esquema de la aplicación, o de forma genérica, de cualquier ARA que use la aplicación en modo _single-user_ o _desktop_ pasa por una serie de pasos.

Cuando el sistema se ejecuta en modo _single-user_ o _desktop_ la configuración habitual es que haya un computador con una instalación local de PostgreSQL donde se ejecuta la aplicación de Inventario y otro computador con su propio PostgreSQL corriendo en `localhost` donde se ejecuta la aplicación de Utentes.

Cuando hay cambios en el esquema de la base de datos suele ser necesario, o al menos conveniente, actualizar todas las aplicaciones e instalaciones de PostgreSQL a la vez para evitar problemas.

Este documento describe una forma de realizar ese proceso.

## Obtener los dumps de producción

En una fecha acordada previamente tras una versión cerrada de la aplicación se solicita al ARA un dump del esquema de `inventario` (hecho a partir del PostgreSQL del computador donde corra la aplicación de Inventario) y un dump del esquema `utentes` (de nuevo del computador donde corra la aplicación de Utentes).

Estos ficheros se nombrarán del siguiente modo: `yymmdd_prod_esquema_bd.dump`. Por ejemplo:

-   `191122_prod_inventario_aranorte.dump`
-   `191122_prod_utentes_aranorte.dump`

Debe evitarse la actualización de datos en el ARA hasta instalar una nueva versión de la aplicación y la base de datos.

## Restaurar una versión local de los datos actualizados

Existe dos tablas que permiten identificar el número de versión con el que se está trabajando en un momento dado: `utentes.version` e `inventario.version`. El primer paso será identificar exactamente con que versión de la base de datos se está trabajando por si hubiera habido algún error en el backup o en la comunicación de que se necesita.

Por ejemplo:

```
pg_restore -t version 191122_prod_inventario_aranorte.dump
pg_restore -t version 191122_prod_utentes_aranorte.dump

[...]
COPY inventario.version (version) FROM stdin;
190528
\.
[...]
COPY utentes.version (version) FROM stdin;
190528
\.
[...]

```

El contenido de las tablas de versión debería ser el mismo para ambos ficheros.

En local se creará la base de datos final del ARA generada para esa versión:

```
source db_utils.sh

DATABASE='aranorte'
BACKUP_INVENTARIO='datos/191118_aran_prod_data_for_191107/aranorte_backupiventario191118'
BACKUP_UTENTES='datos/191118_aran_prod_data_for_191107/191118_BDD_aranorte_schema_utentes_pro.dump'

create_last_db aranorte_post_190528 aranorte_post_190528.dump
create_db_from_template aranorte_post_190528 "${DATABASE}"

delete_all_data_in_schema aranorte utentes
delete_all_data_in_schema aranorte inventario

pg_restore -h localhost -U postgres -d "${DATABASE}" -p "${PG_PORT}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_INVENTARIO}"
pg_restore -h localhost -U postgres -d "${DATABASE}" -p "${PG_PORT}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_UTENTES}"

sqitch status "${DATABASE}"
sqitch deploy "${DATABASE}"

# Update utentes.version and inventario.version if needed

create_db_from_template "${DATABASE}" aranorte_pre_191107
dump_db aranorte_pre_191107
```
