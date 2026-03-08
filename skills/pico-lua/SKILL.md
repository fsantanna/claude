---
name: pico-lua
description: >
    pico-lua / pico-sdl graphics library reference for 2D games
    and applications.
    TRIGGER when: using pico-lua API, pico-sdl bindings,
    or discussing 2D graphics rendering in Lua.
---

# pico-lua

`pico-lua` is a Lua binding for `pico-sdl`, a graphics library
for 2D games and applications based on SDL.

- `pico-sdl`: https://github.com/fsantanna/pico-sdl/
- `pico-lua`:
    https://github.com/fsantanna/pico-sdl/tree/main/lua/
- API:
    https://github.com/fsantanna/pico-sdl/blob/main/lua/doc/api.md

# Idioms and Caveats:

- Color values:
    - use r,g,b fields
    - `@{ r=0xCC, g=0x11, b=0x77 }`
