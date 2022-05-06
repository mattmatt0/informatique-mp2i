SRC_DIR=src
OBJ_DIR=obj
NAME=problemeSat
OUTPUT=$(NAME).pdf

SRC=$(SRC_DIR)/$(NAME).tex
CFLAGS=--output-directory ../$(OBJ_DIR)
VFLAGS=--fullscreen

$(NAME).pdf: $(SRC_DIR)/$(NAME).tex
	(cd src && pdflatex -shell-escape $(CFLAGS) $(NAME).tex)
	mv $(OBJ_DIR)/$(OUTPUT) ./

view: $(NAME).pdf
	evince $(VFLAGS) $(OUTPUT)

adapt:
	-find $(SRC_DIR) -name '*.tex' ! -name 'preamble.tex' -execdir mv {} $(NAME).tex \;
	-mv *.pdf $(NAME).pdf
	-rm -r $(OBJ_DIR)/*
	sed -i "1s:.*:\\\\newcommand\\\\PATH{$$(pwd)}:" $(SRC)

hide:
	sed -i "1s:.*:\\\\newcommand\\\\PATH{Lancez \`make adapt avant de compiler!\`}:" $(SRC)

clean:
	rm -r *.pdf
	rm -r $(OBJ_DIR)/*
