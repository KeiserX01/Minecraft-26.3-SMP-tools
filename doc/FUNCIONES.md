# Referencia de Funciones MultiTag

Este documento referencia todas las funciones del datapack MultiTag, su propósito y su uso.

## Funciones del núcleo (player/)

### load.mcfunction
**Ubicación:** `data/multitag/function/load.mcfunction`  
**Invocación:** Automática al cargar el datapack (tag `minecraft:load`)  
**Propósito:** Inicializa el scoreboard `multitag.tmp`, configura prefix y sufijo predeterminados en `multitag:config`, y resetea `team_id` en `multitag:runtime`.  
**Idempotente:** Sí, puede ejecutarse múltiples veces sin efectos secundarios.

### tick.mcfunction
**Ubicación:** `data/multitag/function/tick.mcfunction`  
**Invocación:** Cada tick (tag `minecraft:tick`)  
**Propósito:** Detecta jugadores sin team y ejecuta su inicialización individualmente.  
**Comando:** `execute as @a[team=] run function multitag:player/initialize`

### player/initialize.mcfunction
**Ubicación:** `data/multitag/function/player/initialize.mcfunction`  
**Invocación:** Por cada jugador sin team, desde tick  
**Propósito:** Captura UUID[0] del jugador, copia configuración predeterminada, invoca la macro de aplicación y limpia.  
**Secuencia:**
1. `data modify storage multitag:runtime team_id set value 0`
2. `execute store result storage multitag:runtime team_id int 1 run data get entity @s UUID[0]`
3. Copia prefix y sufijo desde config a runtime
4. `function multitag:player/apply_team with storage multitag:runtime`
5. `data modify storage multitag:runtime team_id set value 0`

### player/apply_team.mcfunction
**Ubicación:** `data/multitag/function/player/apply_team.mcfunction`  
**Tipo:** Macro (usa interpolación `$(team_id)`)  
**Propósito:** Intenta crear el team y si tiene éxito lo configura y asigna al jugador.  
**Secuencia:**
1. `$execute store success score #created multitag.tmp run team add $(team_id)`
2. `execute if score #created multitag.tmp matches 1 run function multitag:player/configure_team with storage multitag:runtime`
3. `$team join $(team_id) @s`

### player/configure_team.mcfunction
**Ubicación:** `data/multitag/function/player/configure_team.mcfunction`  
**Tipo:** Macro (usa interpolación `$(team_id)`, `$(prefix)`, `$(suffix)`)  
**Propósito:** Aplica prefix y sufijo al team recién creado.  
**Secuencia:**
1. `$team modify $(team_id) prefix $(prefix)`
2. `$team modify $(team_id) suffix $(suffix)`

## Funciones administrativas (admin/)

### open_tag_panel.mcfunction
**Ubicación:** `data/multitag/function/admin/open_tag_panel.mcfunction`  
**Invocación:** `/function multitag:admin/open_tag_panel`  
**Propósito:** Abre el menú principal del Tag Panel.  
**Comando:** `dialog show @s multitag:tag_menu`

### set_prefix.mcfunction
**Ubicación:** `data/multitag/function/admin/set_prefix.mcfunction`  
**Tipo:** Macro (usa interpolación `$(target)`, `$(prefix)`)  
**Invocación:** `/function multitag:admin/set_prefix {target:"Steve",prefix:{text:"...",color:"..."}}`  
**Propósito:** Modifica el prefix del team de un jugador conectado.  
**Secuencia:**
1. `$data modify storage multitag:runtime prefix set value $(prefix)`
2. `$execute as @a[name="$(target)"] run function multitag:admin/apply_prefix`

### apply_prefix.mcfunction
**Ubicación:** `data/multitag/function/admin/apply_prefix.mcfunction`  
**Invocación:** Desde `set_prefix`, ejecutado como el jugador encontrado  
**Propósito:** Obtiene UUID[0] del jugador y aplica el prefix.  
**Secuencia:**
1. `execute store result storage multitag:runtime team_id int 1 run data get entity @s UUID[0]`
2. `function multitag:admin/write_prefix with storage multitag:runtime`
3. `data modify storage multitag:runtime team_id set value 0`

### write_prefix.mcfunction
**Ubicación:** `data/multitag/function/admin/write_prefix.mcfunction`  
**Tipo:** Macro (usa interpolación `$(team_id)`, `$(prefix)`)  
**Propósito:** Aplica el prefix al team correspondiente.  
**Comando:** `$team modify $(team_id) prefix $(prefix)`

### set_suffix.mcfunction
**Ubicación:** `data/multitag/function/admin/set_suffix.mcfunction`  
**Tipo:** Macro (usa interpolación `$(target)`, `$(suffix)`)  
**Invocación:** `/function multitag:admin/set_suffix {target:"Steve",suffix:{text:"...",color:"..."}}`  
**Propósito:** Modifica el suffix del team de un jugador conectado.  
**Secuencia:**
1. `$data modify storage multitag:runtime suffix set value $(suffix)`
2. `$execute as @a[name="$(target)"] run function multitag:admin/apply_suffix`

### apply_suffix.mcfunction
**Ubicación:** `data/multitag/function/admin/apply_suffix.mcfunction`  
**Invocación:** Desde `set_suffix`, ejecutado como el jugador encontrado  
**Propósito:** Obtiene UUID[0] del jugador y aplica el suffix.  
**Secuencia:**
1. `execute store result storage multitag:runtime team_id int 1 run data get entity @s UUID[0]`
2. `function multitag:admin/write_suffix with storage multitag:runtime`
3. `data modify storage multitag:runtime team_id set value 0`

### write_suffix.mcfunction
**Ubicación:** `data/multitag/function/admin/write_suffix.mcfunction`  
**Tipo:** Macro (usa interpolación `$(team_id)`, `$(suffix)`)  
**Propósito:** Aplica el suffix al team correspondiente.  
**Comando:** `$team modify $(team_id) suffix $(suffix)`

## Argumentos de las macros administrativas

### set_prefix
```json
{
  "target": "Steve",
  "prefix": {
    "text": "[Miembro] ",
    "color": "green",
    "bold": true
  }
}
```

### set_suffix
```json
{
  "target": "Steve",
  "suffix": {
    "text": " ★",
    "color": "gold"
  }
}
```

## Scoreboards

| Objetivo | Tipo | Propósito |
|----------|------|-----------|
| `multitag.tmp` | dummy | Almacena el resultado de `team add` (1 = creado, 0 = ya existía) |

## Storages

### multitag:config
```snbt
{
    default: {
        prefix: {text:"[Miembro] ",color:"green",bold:true},
        suffix: {text:""}
    }
}
```

### multitag:runtime
```snbt
{
    team_id: 0,
    prefix: {},
    suffix: {}
}
```
