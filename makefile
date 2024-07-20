# Compiler and compiler flags
NVCC = nvcc
CC = gcc
CFLAGS = -c

# Target executable
TARGET = main

# Object files
OBJS = main.o astar_cuda.o

# Build rules
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ -lcuda -lcudart

main.o: main.c astar_cuda.h
	$(CC) $(CFLAGS) main.c

astar_cuda.o: astar_cuda.cu astar_cuda.h
	$(NVCC) $(CFLAGS) astar_cuda.cu

clean:
	rm -f $(TARGET) $(OBJS)
