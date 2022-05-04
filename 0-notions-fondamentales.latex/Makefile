SRC_DIR=src
OBJ_DIR=obj
INC_DIR=include
NAME=notions-fondamentales
OUTPUT=$(NAME).pdf
INCLUDE=$(wildcard $(INC_DIR)/*.tex)

SRC=$(SRC_DIR)/$(NAME).tex
CFLAGS=--output-directory ../$(OBJ_DIR)
VFLAGS=--fullscreen

$(NAME).pdf: $(SRC_DIR)/$(NAME).tex $(INCLUDE)
	(cd src && pdflatex -shell-escape $(CFLAGS) $(NAME).tex)
	mv $(OBJ_DIR)/$(OUTPUT) ./
view: $(NAME).pdf
	evince $(VFLAGS) $(OUTPUT)
adapt:
	-mv $(SRC_DIR)/* $(SRC_DIR)/$(NAME).tex
	-mv *.pdf $(NAME).pdf
	-rm -r $(OBJ_DIR)/*
	sed -i "1s:.*:\\\\newcommand\\\\PATH{$$(pwd)}:" $(SRC)
clean:
	-rm -r *.pdf
	rm -r $(OBJ_DIR)/*
