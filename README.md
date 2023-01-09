# `celtic-knot` Celtic Knot Cartesian Grid Matrix Pattern Generator for Scaleable Vector Graphics

## Synopsis

```
Usage: ./knot [options]
    -h, --help                       Prints this help
    -V, --vertical=VERTICAL          Number of cells vertically.
    -H, --horizontal=HORIZONTAL      Number of cells horizontally.
    -G, --grid-size=GRID_SIZE        Dimensions of each cell in the grid.
    -b, --background-color=BG_COLOR  Background colour.
    -k, --knot-color=KNOT_COLOR      Knot colour.
    -K, --knot-width=KNOT_WIDTH      Knot width.
    -s, --stroke-color=STROKE_COLOR  Stroke colour.
    -S, --stroke-width=STROKE_WIDTH  Stroke width.
```

### Examples

#### Basic

![Basic knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/basic.svg)

```
./knot \
    --vertical=2 \
    --horizontal=2 \
    --grid-size=96 \
    --background-color='white' \
    --knot-color='white' \
    --knot-width=24 \
    --stroke-color=black \
    --stroke-width=8 \
    > examples/basic.svg
```

#### Ingƿine (Ingthine)

![Ingƿine knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/ingthine.svg)

```
./knot \
    --vertical=3 \
    --horizontal=4 \
    --grid-size=96 \
    --background-color='#012169' \
    --knot-color='#C8102E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=16 \
    > examples/ingthine.svg
```

#### Bratach (Tricolour)

![Bratach knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/bratach.svg)

```
./knot \
    --vertical=5 \
    --horizontal=6 \
    --grid-size=64 \
    --background-color='#169B62' \
    --knot-color='#FF883E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=4 \
    > examples/bratach.svg
```

## Author

2023 Damien Bezborodov
