all: examples/basic.svg examples/ingthine.svg examples/bratach.svg

examples/basic.svg: knot
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

examples/ingthine.svg: knot
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

examples/bratach.svg: knot
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
