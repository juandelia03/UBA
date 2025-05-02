CC = gcc
CFLAGS = -Wall

# Lista de fuentes
SOURCES := $(wildcard ejercicio*.c)

# Transformar ejercicio9.c → ej9
TARGETS := $(patsubst ejercicio%.c,ej%,${SOURCES})

# Regla general para ejN (por ejemplo, ej9 genera ejercicio9)
ej%: ejercicio%.c
	$(CC) $(CFLAGS) -o $@ $<

all: $(TARGETS)


clean:
	find . -maxdepth 1 -type f -executable ! -name "*.*" -exec rm -v {} \;

