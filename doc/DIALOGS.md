# Documentación de Interfaces Dialog — Tag Panel

MultiTag utiliza el sistema nativo de Dialogs de Minecraft Java Edition 26.3 para proporcionar una interfaz administrativa gráfica.

## Resumen

Se implementan **tres Dialogs independientes** de tipo `minecraft:multi_action`:

| Dialog | Archivo | Tipo | Propósito |
|--------|---------|------|-----------|
| `tag_menu` | `dialog/tag_menu.json` | `multi_action` | Menú principal de navegación |
| `tag_prefix` | `dialog/tag_prefix.json` | `multi_action` | Editor de prefix por jugador |
| `tag_suffix` | `dialog/tag_suffix.json` | `multi_action` | Editor de suffix por jugador |

## Diseño visual

La decisión de usar tres Dialogs separados responde a una limitación visual de Minecraft: los elementos de `body` siempre aparecen por encima de los `inputs`. Por lo tanto, no se pueden intercalar encabezados entre los campos de entrada de un mismo formulario.

## tag_menu.json — Menú principal

**Ubicación:** `data/multitag/dialog/tag_menu.json`

- **Título:** "Tag Panel" (aqua, bold, underline)
- **Cuerpo:** Mensaje informativo en itálica
- **Acciones:**
  - `Prefix` → abre `tag_prefix` vía `show_dialog`
  - `Suffix` → abre `tag_suffix` vía `show_dialog`
- **Exit action:** `close` (cierra el menú)

## tag_prefix.json — Editor de prefix

**Ubicación:** `data/multitag/dialog/tag_prefix.json`

- **Título:** "Tag Panel" (aqua, bold, underline)
- **Cuerpo:** Encabezado "━━━━━━Prefix━━━━━━" (gold)
- **Inputs:**
  1. `target` (minecraft:text) — Nombre del jugador
  2. `prefix_text` (minecraft:text) — Texto del prefix
  3. `prefix_color` (minecraft:single_option) — Color del prefix (16 opciones, Blanco por defecto)
- **Acción:** "Aplicar Cambios" → `dynamic/run_command` → `function multitag:admin/set_prefix {...}`
- **Cierre:** Escape permite cerrar (`can_close_with_escape: true`)

## tag_suffix.json — Editor de suffix

**Ubicación:** `data/multitag/dialog/tag_suffix.json`

- **Título:** "Tag Panel" (aqua, bold, underline)
- **Cuerpo:** Encabezado "━━━━━━Suffix━━━━━━" (gold)
- **Inputs:**
  1. `target` (minecraft:text) — Nombre del jugador
  2. `suffix_text` (minecraft:text) — Texto del suffix
  3. `suffix_color` (minecraft:single_option) — Color del suffix (16 opciones, Blanco por defecto)
- **Acción:** "Aplicar Cambios" → `dynamic/run_command` → `function multitag:admin/set_suffix {...}`
- **Cierre:** Escape permite cerrar (`can_close_with_escape: true`)

## Colores disponibles

Los 16 colores estándar de Minecraft, con Blanco como opción inicial:

| ID | Nombre mostrado |
|----|-----------------|
| `white` | Blanco |
| `black` | Negro |
| `dark_blue` | Azul Oscuro |
| `dark_green` | Verde Oscuro |
| `dark_aqua` | Aqua Oscuro |
| `dark_red` | Rojo Oscuro |
| `dark_purple` | Púrpura Oscuro |
| `gold` | Oro |
| `gray` | Gris |
| `dark_gray` | Gris Oscuro |
| `blue` | Azul |
| `green` | Verde |
| `aqua` | Aqua |
| `red` | Rojo |
| `light_purple` | Púrpura |
| `yellow` | Amarillo |

## Tipo de acción utilizado

Los editores utilizan `minecraft:dynamic/run_command` (no `minecraft:run_command`) porque:

- `minecraft:run_command` **no interpola** los placeholders `$(key)` — los pasa literalmente
- `minecraft:dynamic/run_command` **sí interpola** los placeholders `$(key)` con los valores de los inputs

**Ejemplo de comando generado:**
```mcfunction
function multitag:admin/set_prefix {target:"Steve",prefix:{text:"Hello",color:"green"}}
```

## Flujo de uso

1. El administrador ejecuta `/function multitag:admin/open_tag_panel`
2. Se abre `tag_menu` con tres botones: Prefix, Suffix, Exit
3. El administrador selecciona "Prefix" o "Suffix"
4. Se abre el editor correspondiente con campos para nombre, texto y color
5. El administrador rellena los campos y pulsa "Aplicar Cambios"
6. El Dialog ejecuta la función administrativa correspondiente con los valores interpolados
7. La función resuelve al jugador, obtiene su UUID[0] y aplica el cambio al team

## Limitaciones

- Los Dialogs funcionan solo con jugadores conectados (`@a`)
- Los valores de los inputs no se validan automáticamente
- Caracteres especiales en los campos (comillas, barras invertidas) pueden romper la construcción SNBT
- No hay sistema de protecciones de permisos integrado en los Dialogs
