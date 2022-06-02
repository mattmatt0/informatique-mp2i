DIRS:=$(wildcard *.latex)
PDFS:=$(foreach D,$(DIRS),$(patsubst $D/src/%.tex,$D/%.pdf,$(wildcard $D/src/*.tex)))
GLOBAL_VIEWER=evince	


all: $(PDFS)

hide:
	for i in $(DIRS); do (cd $$i ; make hide); done

clean:
	rm $(PDFS)

%.pdf:
	(cd $$(dirname $*) ; make clean; make adapt; make)

preview:
	for i in $(DIRS); do (cd $$i; make adapt; make preview); done

view:
	for i in $(PDFS); do $(GLOBAL_VIEWER) $$i; done
