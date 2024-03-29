DIRS:=$(wildcard *.latex)
PDFS:=$(foreach D,$(DIRS),$(patsubst $D/src/%.tex,$D/%.pdf,$(wildcard $D/src/*.tex)))
GLOBAL_VIEWER=xdg-open	

all: $(PDFS)

hide:
	for i in $(DIRS); do (cd $$i ; make hide); done

clean:
	for i in $(DIRS); do (cd $$i ; make clean); done

%.pdf:
	(cd $$(dirname $*) ; make clean; make adapt; make)

preview:
	for i in $(DIRS); do (cd $$i; make adapt; make preview); done

view:
	for i in $(PDFS); do $(GLOBAL_VIEWER) $$i; done
