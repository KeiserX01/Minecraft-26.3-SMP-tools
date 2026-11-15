# Instalación y Uso de MultiTag

## Requisitos

- Minecraft Java Edition 26.3
- Un mundo con cheats habilitados (para ejecutar funciones)

## Instalación

1. Copiar la carpeta `multitag/` al directorio `datapacks/` del mundo:
   ```
   saves/<nombre_del_mundo>/datapacks/multitag/
   ```

2. Iniciar el mundo en Minecraft Java Edition 26.3

3. Ejecutar `/reload` para cargar el datapack

4. Verificar que el datapack esté activo con `/datapack list`

## Uso básico

### Asignación automática de teams

Cuando un jugador se une al mundo y no tiene team, el datapack:
1. Detecta que no tiene team (`@a[team=]`)
2. Obtiene su `UUID[0]`
3. Crea un team con ese nombre (si no existe)
4. Aplica el prefijo y sufijo predeterminados
5. Asigna al jugador al team

Esto ocurre automáticamente en cada tick, sin intervención del administrador.

### Abrir el panel administrativo

```mcfunction
/function multitag:admin/open_tag_panel
```

Esto abre el Dialog `tag_menu` donde el administrador puede:
- Seleccionar "Prefix" para abrir el editor de prefix
- Seleccionar "Suffix" para abrir el editor de suffix
- Seleccionar "Exit" para cerrar el menú

### Modificar prefix de un jugador

Desde el editor Prefix del Tag Panel:
1. Introducir el nombre del jugador (exacto, con mayúsculas y minúsculas)
2. Introducir el texto del prefix
3. Seleccionar el color del prefix
4. Pulsar "Aplicar Cambios"

También directamente por comando:
```mcfunction
/function multitag:admin/set_prefix {target:"Steve",prefix:{text:"[Miembro] ",color:"green",bold:true}}
```

### Modificar suffix de un jugador

Desde el editor Suffix del Tag Panel:
1. Introducir el nombre del jugador
2. Introducir el texto del suffix
3. Seleccionar el color del suffix
4. Pulsar "Aplicar Cambios"

También directamente por comando:
```mcfunction
/function multitag:admin/set_suffix {target:"Steve",suffix:{text:" ★",color:"gold"}}
```

### Quitar prefix o suffix

Establecer el texto como cadena vacía:
```mcfunction
/function multitag:admin/set_prefix {target:"Steve",prefix:{text:""}}
/function multitag:admin/set_suffix {target:"Steve",suffix:{text:""}}
```

## Persistencia

- Los scoreboard teams son persistentes en el mundo
- Los datos de Command Storage son persistentes en el mundo
- `runtime` se utiliza como almacenamiento temporal, no como base de datos
- Los jugadores que se reconectan conservan su team
- Al ejecutar `/reload` no se borran teams ni datos de configuración

## Solución de problemas

| Problema | Posible causa | Solución |
|----------|---------------|----------|
| El jugador no recibe team | Ya tiene un team asignado | Esperar a que salga del team o asignarlo manualmente |
| El Dialog no se abre | El datapack no está cargado | Ejecutar `/reload` |
| Los placeholders no se interpolan | Uso de `run_command` en lugar de `dynamic/run_command` | Verificar que los Dialogs usen `dynamic/run_command` |
| El nombre del jugador no se encuentra | Nombre incorrecto o jugador desconectado | Verificar el nombre exacto y que el jugador esté conectado |
| Prefix/suffix no se aplican | El jugador no tiene team | El sistema solo modifica teams existentes |
