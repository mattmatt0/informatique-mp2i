OUTPUT=$(NAME).pdf
SRC=$(SRC_DIR)/$(NAME).tex

$(NAME).pdf: $(SRC_DIR)/$(NAME).tex $(INCLUDE)
	(cd src && pdflatex $(CFLAGS) $(NAME).tex)
	mv $(OBJ_DIR)/$(OUTPUT) ./

preview:
	-sed -i "s/\\\\documentclass{scrartcl}/\\\\documentclass{article}/g" $(SRC)
	-make $(NAME.pdf)
	sed -i "s/\\\\documentclass{article}/\\\\documentclass{scrartcl}/g" $(SRC)
	$(VIEWER) $(OUTPUT)


view: $(NAME).pdf
	mkdir -p obj
	$(VIEWER) $(OUTPUT)

adapt:
	-mv $(SRC_DIR)/* $(SRC_DIR)/$(NAME).tex
	-mv *.pdf $(NAME).pdf
	-rm -r $(OBJ_DIR)/*
	sed -i "1s:.*:\\\\newcommand\\\\PATH{$$(pwd)}:" $(SRC)

hide:
	sed -i "1s:.*:\\\\newcommand\\\\PATH{Lancez \`make adapt avant de compiler!\`}:" $(SRC)
	
clean:
	-rm -r $(NAME).pdf
	rm -r $(OBJ_DIR)/*
