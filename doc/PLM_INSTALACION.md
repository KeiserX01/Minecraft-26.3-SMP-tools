# Instalación y Uso de PLM

## Requisitos

- Minecraft Java Edition 26.3
- Datapack MultiTag instalado en el mismo mundo

## Instalación

1. Copiar la carpeta `plm/` al directorio `datapacks/` del mundo:
   ```
   saves/<nombre_del_mundo>/datapacks/plm/
   ```

2. Asegurar que MultiTag esté instalado:
   ```
   saves/<nombre_del_mundo>/datapacks/multitag/
   ```

3. Iniciar el mundo en Minecraft Java Edition 26.3

4. Ejecutar `/reload` para cargar ambos datapacks

5. Verificar que ambos datapacks estén activos con `/datapack list`

## Uso

### Iniciar una operación de Prank Level

Un jugador puede solicitar un cambio de Prank Level siguiendo estos pasos:

1. Verificar que no tiene operación pendiente (`prank_operations = 0`)
2. Establecer el nivel deseado:
   ```mcfunction
   scoreboard players set @s prank_level 2
   ```
3. Obtener el tiempo actual:
   ```mcfunction
   execute store result score #now plm_clock run time query gametime
   ```
4. Calcular el deadline:
   ```mcfunction
   scoreboard players operation @s prank_deadline = #now plm_clock
   scoreboard players operation @s prank_deadline += #cooldown plm_clock
   ```
5. Marcar la operación como pendiente:
   ```mcfunction
   scoreboard players set @s prank_operations 1
   ```

### Verificar estado

```mcfunction
scoreboard players get @s prank_operations
scoreboard players get @s prank_level
scoreboard players get @s prank_deadline
```

### Cambiar la duración del cooldown

```mcfunction
data modify storage plm:config operation_cooldown_seconds set value 3600
```

Luego recargar con `/reload` para aplicar la conversión a ticks.

## Integración con MultiTag

PLM utiliza `multitag:admin/set_suffix_self` para aplicar suffixes al jugador que completa una operación. Este adaptador debe existir en MultiTag para que PLM funcione correctamente.
