DIRS:=$(wildcard *.latex)
PDFS:=$(foreach D,$(DIRS),$(patsubst $D/src/%.tex,$D/%.pdf,$(wildcard $D/src/*.tex)))
GLOBAL_VIEWER=xdg-open	


all: $(PDFS)

hide:
	for i in $(DIRS); do (cd $$i ; make hide); done

clean:
	rm $(PDFS)

%.pdf:
	(cd $$(dirname $*) ; make clean; make adapt; make)

view:
	for i in $(PDFS); do $(GLOBAL_VIEWER) $$i; done
