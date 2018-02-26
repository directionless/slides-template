all: offline

.PHONY: slides.html
slides.html:
	cp header.html $@
	(for f in src/*md; do cat $$f; echo ---; done) >> $@
	echo "class: center, middle\n# The End" >> $@
	cat footer.html >> $@

.PHONY: offline
offline: slides.html remark-latest.min.js
	perl -pi -e 's{https://gnab.github.io/remark/downloads/remark-latest.min.js}{remark-latest.min.js}' $<

remark-latest.min.js:
	wget https://gnab.github.io/remark/downloads/remark-latest.min.js

.PHONY: clean
clean:
	rm -f slides.html
	rm -f remark-latest.min.js
