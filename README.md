# `celtic-knot` Celtic Knot Cartesian Grid Matrix Pattern Generator for Scaleable Vector Graphics

**`celtic-knot`** is a [Ruby](https://www.ruby-lang.org/en/) programme that creates simple rectangular celtic knot drawings based upon a given set of parameters.

## Synopsis

The drawing is in [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) (Scaleable Vector Graphics) format, which is sent to standard output.

```
Usage: ./knot [options]
    -h, --help                       Prints this help
    -V, --vertical=VERTICAL          Number of cells vertically.
    -H, --horizontal=HORIZONTAL      Number of cells horizontally.
    -G, --cell-size=CELL_SIZE        Dimensions of each cell in the grid.
    -b, --background-color=BG_COLOR  Background colour.
    -k, --knot-color=KNOT_COLOR      Knot colour.
    -K, --knot-width=KNOT_WIDTH      Knot width.
    -s, --stroke-color=STROKE_COLOR  Stroke colour.
    -S, --stroke-width=STROKE_WIDTH  Stroke width.
```

## Usage

### Examples

#### Basic

![Basic knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/basic.svg)

```
$ ./knot \
    --vertical=2 \
    --horizontal=2 \
    --cell-size=96 \
    --background-color='white' \
    --knot-color='white' \
    --knot-width=24 \
    --stroke-color=black \
    --stroke-width=8 \
    > examples/basic.svg
```

#### Ingƿine

![Ingƿine knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/ingthine.svg)

```
$ ./knot \
    --vertical=3 \
    --horizontal=4 \
    --cell-size=96 \
    --background-color='#012169' \
    --knot-color='#C8102E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=16 \
    > examples/ingthine.svg
```

#### Bratach (Banner)

![Bratach knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/bratach.svg)

```
$ ./knot \
    --vertical=5 \
    --horizontal=6 \
    --cell-size=64 \
    --background-color='#169B62' \
    --knot-color='#FF883E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=4 \
    > examples/bratach.svg
```

### Converting SVG to Other Formats

The SVG file can be viewed locally in your Web browser or converted into other formats such as [PNG](http://www.libpng.org/pub/png/) using utilities such as ImageMagick's [`convert`](https://imagemagick.org/script/convert.php). For example:

```
convert -background none examples/basic.svg examples/basic.png
```


## Internals

The programme generates SVG output using the [Nokogiri](https://nokogiri.org/) library for [XML](https://www.w3.org/standards/xml/core).

The knot is modelled as a two dimensional matrix (`Knot::Grid`), which itself contains cells (`Knot::Cell`), which then contains absolutely positioned precalculated points (`Knot::Point`) that are used for pathing by the drawing engine (`Knot`.)

### Classes

#### `Knot::Grid < Matrix`

The grid is a [`Matrix`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Matrix.html) of cells. The grid can be nagivated with absolute coordinates using the `position(x, y)` method and nearby cells accessed relatively using the `rel(x, y)` method.

#### `Knot::Cell`

Each cell with the grid contains a number of cartesian points. These points are precaclulated so that minimal calculations are required when pathing.

#### `Knot::Point < Vector`

Each point is modelled as a [`Vector[x, y]`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Vector.html).

#### `Knot::Point.midpoint(a, b)`

Calculates the midpoint between two `Points`. Used where a desired point has not been precalculated but can instead be derived from another pair of points that *are* precaculated.

#### `Knot::Point.distance(a, b)`

Calculates the distance between two `Points`. Used for calculating radii for arc curves.

#### `Knot::Path`

Models an [SVG path](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths).

## Author

2023 Damien Bezborodov
