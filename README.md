# Celtic Knot Generator for SVG

**`celtic-knot`** is a [Ruby](https://www.ruby-lang.org/en/) programme that creates simple rectangular
celtic knot drawings based upon a given set of parameters. The images are in a vector format.

## Synopsis

The drawing is in [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) (Scaleable Vector Graphics) format, which is sent to standard output.

## Usage

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

### Examples

#### Basic

![Basic knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/basic.svg)

```
$ ./knot \
    --vertical=2 \
    --horizontal=2 \
    --cell-size=96 \
    --knot-color='white' \
    --knot-width=24 \
    --stroke-color=black \
    --stroke-width=8 \
    > examples/basic.svg
```

#### Ingƿine

![Ingƿine knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/ingwine.svg)

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
    > examples/ingwine.svg
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

TODO: Move to API reference docs.

[API Documentation](https://www.rubydoc.info/github/bezborodow/celtic-knot/main)

The programme generates SVG output using the [Nokogiri](https://nokogiri.org/) library for [XML](https://www.w3.org/standards/xml/core).

The knot is modelled as a two dimensional matrix (`Knot::Grid`), which itself contains cells (`Knot::Cell`), which then contains absolutely
positioned precalculated cartesian points (`Knot::Point`) that are used for pathing by the drawing engine (`Knot`.)

### Modules

#### `Knot`

The drawing engine.

### Classes

#### `Knot::Grid`

The grid is a [`Matrix`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Matrix.html) of cells (arranged as rows and columns.) The grid can be nagivated with absolute coordinates using the `position(i, j)` method and nearby cells accessed relatively using the `rel(i, j)` method.

#### `Knot::Cell`

Each cell within the grid contains several cartesian points stored in hashes. These points are precaclulated so that minimal calculations are required when pathing.

#### `Knot::Point`

Each point is modelled in the cartesian plane as a [`Vector[x, y]`](https://ruby-doc.org/stdlib-3.0.2/libdoc/matrix/rdoc/Vector.html).

#### `Knot::Path`

Models an [SVG path](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths).

### Class Methods

#### `Knot::Point.midpoint(a, b)`

Calculates the midpoint between two points. Used where a desired point has not been precalculated but can instead be derived from another pair of points that *are* precalculated.

#### `Knot::Point.distance(a, b)`

Calculates the distance between two points. Used for calculating radii for arc curves.

## Author

2023 Damien Bezborodov
