# Changelog — Mod Jokers

---

## v0.1 — Estructura base
- Creación de la carpeta del mod `MisMods`
- Instalación de Lovely Injector y Steamodded
- Primer archivo `MisMods.lua` con header de Steamodded
- Registro del primer Atlas (`SMODS.Atlas`) con imagen placeholder
- Registro del primer Joker de prueba (`joker_prueba`) con +10 Mult
- Corrección: imagen en formato `.jpg` no soportada, migrada a `.png`
- Corrección: carpeta de assets movida a `assets/2x/` según estructura requerida por Steamodded

---

## v0.2 — Ajustes de escala y estructura de imágenes
- Detección de escala incorrecta (138x138), corregida a 71x95 extrayendo el atlas original del juego (`Jokers.png`) con 7-Zip
- Intento de atlas compartido (una sola imagen con todos los Jokers en fila) descartado por problemas de proporciones
- Migración a imágenes independientes por Joker, cada una con su propio `SMODS.Atlas`
- Establecimiento del proceso de arte: usar un Joker original como marco en una capa bloqueada y pegar la imagen personalizada en una capa nueva

---

## v0.3 — Joker 1: Tux Malvado
- Registro de `joker_1` con nombre "Tux Malvado"
- Mecánica: -10 Mult pasivo
- Corrección: texto mostraba "--10" en vez de "-10", resuelto guardando el valor como positivo en `config` y aplicando el negativo en `calculate`
- Arte: logo de Linux (Tux) con logo de Apple superpuesto usando marco original del juego

---

## v0.4 — Joker 2: Genio!!!
- Registro de `joker_2` con nombre "Genio!!!"
- Mecánica: si la barra de Jokers está llena, otorga +600 fichas y x700 Mult
- Corrección: `config` tenía `mult` en vez de `chips`, corregido
- Corrección: `loc_vars` faltaba, causaba que el texto mostrara "+nilfichas", agregado correctamente
- Corrección: `pos` tenía `x = 1` en vez de `x = 0`, corregido al migrar a atlas independiente
- Rareza cambiada a legendaria (`rarity = 4`) por lo poderoso del efecto
- Costo establecido en $15

---

## v0.5 — Joker 3: Juan
- Registro de `joker_3` con nombre "Juan"
- Mecánica: si Tux Malvado está equipado, otorga +3 Mult por cada carta en la baraja
- Implementación de iteración sobre `G.jokers.cards` para detectar la presencia de `joker_1`
- Rareza establecida en raro (`rarity = 3`)
- Corrección: `pos` tenía `x = 2` en vez de `x = 0`, corregido

---

## v0.6 — Joker 4: Win_Joker
- Registro de `joker_4` con nombre "Win_Joker"
- Mecánica: otorga +10 Mult por cada Joker del pack equipado (máximo +30)
- Implementación de `loc_vars` con verificación `if G.jokers then` para evitar crash en el menú principal
- Corrección: crash al ver la colección desde el menú por `G.jokers` siendo nil fuera de partida, resuelto con la verificación
- Arte: el más elaborado del pack, basado en el sprite del Joker base del juego recoloreado con la paleta del logo de Windows, con logos de Windows agregados en las esquinas
- Rareza establecida en inusual (`rarity = 2`)

---

## v1.0 — Entrega final
- Ajuste de rarezas para que cada Joker tenga un nivel distinto: Común, Inusual, Raro y Legendario
- Revisión general del código y comentarios internos
- Creación de README.md con instrucciones de instalación
- Creación de este CHANGELOG
- Cambio de signos en el joker 3 y 4 para evitar confusiones (ambos mostraban +mult en vez de xmult)
