SRC_DIR=src
OBJ_DIR=obj
INC_DIR=include

INCLUDE=$(wildcard $(INC_DIR)/*.tex)

CFLAGS=--shell-escape --output-directory ../$(OBJ_DIR)
VIEWER=evince --fullscreen
