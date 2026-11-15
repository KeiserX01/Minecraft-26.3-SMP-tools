# MultiTag — Datapack para Minecraft Java Edition 26.3

Datapack vanilla que asigna un scoreboard team individual a cada jugador utilizando `UUID[0]` como nombre del team, con interfaz administrativa nativa (Dialogs) para modificar prefix y suffix.

## Estructura del proyecto

```
prefix2/
├── multitag/                          # Datapack
│   ├── pack.mcmeta                    # Data Pack Format 121.0
│   ├── data/
│   │   ├── minecraft/
│   │   │   └── tags/function/
│   │   │       ├── load.json
│   │   │       └── tick.json
│   │   └── multitag/
│   │       ├── dialog/                # Interfaces Dialog
│   │       │   ├── tag_menu.json      # Menú principal
│   │       │   ├── tag_prefix.json    # Editor de prefix
│   │       │   └── tag_suffix.json    # Editor de suffix
│   │       └── function/
│   │           ├── load.mcfunction
│   │           ├── tick.mcfunction
│   │           ├── player/
│   │           │   ├── initialize.mcfunction
│   │           │   ├── apply_team.mcfunction
│   │           │   └── configure_team.mcfunction
│   │           └── admin/
│   │               ├── open_tag_panel.mcfunction
│   │               ├── set_prefix.mcfunction
│   │               ├── apply_prefix.mcfunction
│   │               ├── write_prefix.mcfunction
│   │               ├── set_suffix.mcfunction
│   │               ├── apply_suffix.mcfunction
│   │               └── write_suffix.mcfunction
├── doc/                               # Documentación
│   ├── README.md                      # Este archivo
│   ├── ARQUITECTURA.md                # Diseño y arquitectura
│   ├── FUNCIONES.md                   # Referencia de funciones
│   ├── DIALOGS.md                     # Documentación de interfaces Dialog
│   ├── INSTALACION.md                 # Instalación y uso
│   └── LIMITACIONES.md                # Limitaciones conocidas
└── MEMORY.md                          # Índice de memoria (si aplica)
```

## Características

- ✅ Asignación automática de teams por `UUID[0]` de cada jugador
- ✅ Prefijo y sufijo predeterminados aplicados al crear un team nuevo
- ✅ Players reconectados mantienen su team (sin reprocesamiento)
- ✅ Interfaz administrativa nativa (Dialogs) para modificar prefix/suffix
- ✅ Tres Dialogs independientes: menú, editor prefix, editor suffix
- ✅ 16 colores estándar de Minecraft disponibles
- ✅ Almacenamiento temporal en `multitag:runtime`
- ✅ Configuración persistente en `multitag:config`

## Versiones

- **Minecraft:** Java Edition 26.3
- **Data Pack Format:** 121.0
- **Namespace:** `multitag`

## Instalación rápida

1. Copiar la carpeta `multitag/` a `saves/<mundo>/datapacks/`
2. Ejecutar `/reload` en el juego
3. Abrir el panel: `/function multitag:admin/open_tag_panel`

## Documentación detallada

### MultiTag

- [Arquitectura](ARQUITECTURA.md) — Diseño del sistema y flujo de ejecución
- [Funciones](FUNCIONES.md) — Referencia completa de todas las funciones
- [Dialogs](DIALOGS.md) — Documentación de las interfaces Dialog
- [Instalación](INSTALACION.md) — Guía de instalación y uso
- [Limitaciones](LIMITACIONES.md) — Limitaciones conocidas del proyecto

### PLM (Prank Level Manager)

- [PLM README](PLM_README.md) — Resumen general y ejemplos
- [PLM Arquitectura](PLM_ARQUITECTURA.md) — Diseño del sistema y flujo de ejecución
- [PLM Instalación](PLM_INSTALACION.md) — Guía de instalación y uso
- [PLM Limitaciones](PLM_LIMITACIONES.md) — Limitaciones conocidas del proyecto

## Ejemplos de uso

### Abrir el panel administrativo
```mcfunction
/function multitag:admin/open_tag_panel
```

### Modificar prefix directamente (sin Dialog)
```mcfunction
/function multitag:admin/set_prefix {target:"Steve",prefix:{text:"[Miembro] ",color:"green",bold:true}}
```

### Modificar suffix directamente (sin Dialog)
```mcfunction
/function multitag:admin/set_suffix {target:"Steve",suffix:{text:" ★",color:"gold"}}
```

## Soporte

Este datapack está diseñado para Minecraft Java Edition 26.3. No implementa sistemas de debug, migración, registro de propietarios ni APIs adicionales.
