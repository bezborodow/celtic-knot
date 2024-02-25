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

```console
./knot \
    --vertical=2 \
    --horizontal=2 \
    --cell-size=96 \
    --knot-color='white' \
    --knot-width=24 \
    --stroke-color=black \
    --stroke-width=8 \
    > basic.svg
```

#### Ingƿine

![Ingƿine knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/ingwine.svg)

```console
./knot \
    --vertical=3 \
    --horizontal=4 \
    --cell-size=96 \
    --background-color='#012169' \
    --knot-color='#C8102E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=16 \
    > ingwine.svg
```

#### Bratach (Banner)

![Bratach knot](https://raw.githubusercontent.com/bezborodow/celtic-knot/main/examples/bratach.svg)

```console
./knot \
    --vertical=5 \
    --horizontal=6 \
    --cell-size=64 \
    --background-color='#169B62' \
    --knot-color='#FF883E' \
    --knot-width=32 \
    --stroke-color=white \
    --stroke-width=4 \
    > bratach.svg
```

### Converting SVG to Other Formats

The SVG file can be viewed locally in your Web browser or converted into other formats such as [PNG](http://www.libpng.org/pub/png/) using utilities such as ImageMagick's [`convert`](https://imagemagick.org/script/convert.php). For example:

```
convert -background none examples/basic.svg examples/basic.png
```

## Installation

### Fedora

```console
sudo dnf install ruby rubygem-nokogiri
mkdir ~/src
cd ~/src/
git clone git@github.com:bezborodow/celtic-knot.git
cd celtic-knot
bundle install --local
```


## Internals

[API Documentation](https://www.rubydoc.info/github/bezborodow/celtic-knot/)

## Author

2023 Damien Bezborodov
