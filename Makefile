IDIR=./include
BDIR=./bin
TARGET=imageUndo
TARGET_EXTENSION=.exe
COMPILER=nvcc
INCLUDES=-I/usr/local/cuda/include -I/usr/local/cuda/lib64 -I../../../lib/cub/ -I../../../lib/cuda-samples/Common
LIBS=-lcudart -lcuda
COMPILER_OPTIONS=--std c++17
COMPILER_FLAGS=-I$(IDIR) $(INCLUDES) $(LIBS) $(COMPILER_OPTIONS)

.PHONY: clean build run

build: *.cu
	$(COMPILER) $(COMPILER_FLAGS) *.cu -o $(BDIR)/$(TARGET)$(TARGET_EXTENSION)

clean:
	rm -f $(TARGET)$(TARGET_EXTENSION)

run:
	$(BDIR)/$(TARGET)$(TARGET_EXTENSION)

all: clean build run