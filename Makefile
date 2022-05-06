DIRS:=$(wildcard *.latex)
PDFS:=$(foreach D,$(DIRS),$(patsubst $D/src/%.tex,$D/%.pdf,$(wildcard $D/src/*.tex)))
	


all: $(PDFS)

hide:
	for i in $(DIRS); do (cd $$i ; make hide); done

clean:
	rm $(PDFS)

%.pdf:
	(cd $$(dirname $*) ; make clean; make adapt; make)

