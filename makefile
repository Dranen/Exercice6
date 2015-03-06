CC = g++
CFLAGS = -Wall  -pedantic -ansi -g
CC=icc
CFLAGS = 
EXEC_NAME = ef
INCLUDES =
LIBS =
OBJ_FILES = ElementsFinisSolution.o
INSTALL_DIR = ~/bin

all : $(EXEC_NAME)

clean :
	rm $(EXEC_NAME) $(OBJ_FILES)  

$(EXEC_NAME) : $(OBJ_FILES)
	$(CC) -o $(EXEC_NAME) $(OBJ_FILES) $(LIBS)

%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ -c $<

%.o: %.cc
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ -c $<

%.o: %.c
	gcc $(CFLAGS) $(INCLUDES) -o $@ -c $<

install :
	cp $(EXEC_NAME) $(INSTALL_DIR)

zip :
	mv Exercice1.cpp Exercice1_solution.cpp
	mv Exercice1_etudiant.cpp Exercice1.cpp
	zip $(EXEC_NAME).zip makefile $(addsuffix .cpp, $(basename $(OBJ_FILES))) $(addsuffix .hpp, $(basename $(OBJ_FILES))) plotExercice1.m configuration.in
	mv Exercice1.cpp Exercice1_etudiant.cpp
	mv Exercice1_solution.cpp Exercice1.cpp

correction :
	zip $(EXEC_NAME)_correction.zip makefile $(addsuffix .cpp, $(basename $(OBJ_FILES))) $(addsuffix .hpp, $(basename $(OBJ_FILES))) plotExercice1.m configuration.in
