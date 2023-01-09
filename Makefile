all: ingthine.svg bratach.svg basic.svg

ingthine.svg: knot
	./knot \
		--vertical=3 \
		--horizontal=4 \
		--grid-size=96 \
		--background-color='#012169' \
		--knot-color='#C8102E' \
		--knot-width=32 \
		--stroke-color=white \
		--stroke-width=16 \
		> ingthine.svg

bratach.svg: knot
	./knot \
		--vertical=5 \
		--horizontal=6 \
		--grid-size=64 \
		--background-color='#169B62' \
		--knot-color='#FF883E' \
		--knot-width=32 \
		--stroke-color=white \
		--stroke-width=4 \
		> bratach.svg

basic.svg: knot
	./knot \
		--vertical=3 \
		--horizontal=3 \
		--grid-size=96 \
		--background-color='white' \
		--knot-color='white' \
		--knot-width=24 \
		--stroke-color=black \
		--stroke-width=8 \
		> basic.svg
