# Actualizar BD

1. Solicitar dump del esquema utentes
2. Revisar valor de utentes.version en el dump
3. Construír base de datos vacía con el tag de utentes.version

4. Restaurar datos del dump

```
pg_restore -a FECHA_sixhiarautentes.backup > FECHA.sql
# Reordenar datos para respetar las fk
psql -h localhost -U postgres -d aranorte -f FECHA.sql
```

5. Aplicar cambios de sqitch
6. Probar aplicación

7. Generar versiones

8. Renombrar base de datos 'aranorte' a 'aranorte_antigua'
9. Crear base de datos 'aranorte'
10. Restaurar nuevo dump
