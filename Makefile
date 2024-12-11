# Makefile for my-c-grep

CC = gcc
CFLAGS = -Wall -Wextra -O2 -pg -ggdb3
TARGET = my-c-grep
SRC = my-c-grep.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)


.PHONY: all clean
