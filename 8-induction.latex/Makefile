SRC_DIR=src
OBJ_DIR=obj
NAME=chap7
OUTPUT=$(NAME).pdf

SRC=$(SRC_DIR)/$(NAME).tex
CFLAGS=--output-directory ../$(OBJ_DIR)
VFLAGS=--fullscreen

$(NAME).pdf: $(SRC_DIR)/$(NAME).tex
	(cd src && pdflatex -shell-escape $(CFLAGS) *.tex)
	mv $(OBJ_DIR)/$(OUTPUT) ./
view: $(NAME).pdf
	evince $(VFLAGS) $(OUTPUT)
adapt:
	-mv $(SRC_DIR)/*.tex $(SRC_DIR)/$(NAME).tex	
	-mv *.pdf $(NAME).pdf
	-rm -r $(OBJ_DIR)/*
	sed -i "1s:.*:\\\\newcommand\\\\PATH{$$(pwd)/obj}:" $(SRC)
clean:
	rm -r *.pdf
	rm -r $(OBJ_DIR)/*
