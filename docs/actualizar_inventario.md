Se debe recibir un dump del esquema inventario de la base de datos con nombre <fecha>\_aranorte_inventario.backup

Editar el script `upload_and_dump_all.sh` para poner <fecha> en la variable `INVENTARIO_VERSION`. Ejecutar el script para regenerar todas las bases de datos.

Si se quiere hacer una actualización parcial:

-   Se eliminan los datos del esquema de inventario `delete_inventario_data.sh <base_de_datos> <fecha_backup>`
-   Se convierte el dump a sql. Dependiendo de la versión con que se haya hecho el dump y la versión que se use para recuperar puede haber problemas, por eso mejor pasar a sql

/usr/lib/postgresql/9.5/bin/pg_restore --data-only --single-transaction --exit-on-error --disable-triggers datos/180313_aranorte_inventario.backup > foo.sql

-   Se revisa el dump, seguramente hay que borrar la fila relativa a `row_security` y meter `inventario` en el `search_path`

-   Se ejecuta el script modificado

psql -h localhost -d test -h localhost -U postgres -f foo.sql

En caso de que haya habido cambios a nivel esquema, hay que tener cuidado y proceder de forma distinta.
