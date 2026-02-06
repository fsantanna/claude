# pico-atmos

See `pico-lua.md` and `atmos.md`.

`pico-atmos` combines Atmos and `pico-lua` to program 2D applications and
games.

# Examples

- Games developed in `pico-atmos`:
    - Birds: https://github.com/atmos-lang/pico-birds/
        - a tutorial progression from `01` to `11`
    - Rocks: https://github.com/atmos-lang/pico-rocks/
        - a simple, but complete game

# Programming Patterns:

A case study rewrote the game logic of Pingus using structured reactive
programming.
That study identified **5 control-flow patterns** commonly found in
game development:

1.  **Finite State Machines** --- entities whose behavior maps event
    occurrences to transitions between states (e.g., double-click
    detection, character animations).
2.  **Continuation Passing** --- long-lasting activities that carry an
    action to execute next upon completion (e.g., interactive dialogs,
    menu transitions).
3.  **Dispatching Hierarchies** --- container entities that
    automatically forward stimuli to managed children (e.g., redraw and
    update callbacks).
4.  **Lifespan Hierarchies** --- container entities whose termination
    automatically destroys managed children (e.g., UI containers,
    particle systems).
5.  **Signaling Mechanisms** --- entities that communicate explicitly
    when no hierarchy relationship exists between them (e.g., key
    shortcuts, screen pausing).

Case Study:     https://fsantanna.github.io/pingus/
Pingus:         https://pingus.github.io/

# Idioms and Caveats:

- `pico.set.*` becomes `pico.zet.*` (because `set` is a keyword in Atmos)
- Key events:
    - `every it in :key.dn { ... }`
    - `it.key` can be `:Left`, `:Up`, etc
- Collisions
    - typically pass `t[i].pub.rect` to `pico.vs`
