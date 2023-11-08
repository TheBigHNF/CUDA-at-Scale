IDIR=./include
BDIR=../bin
TARGET=imageUndo
TARGET_EXTENSION=.exe
OBJECT_EXTENSION=.o
SOURCE_EXTENSION=.cpp
COMPILER=nvcc
HOST_COMPILER=g++
NVCC=$(CUDA_PATH)/bin/$(COMPILER) -ccbin $(HOST_COMPILER)
NVCCFLAGS=-m64
ALL_CCFLAGS=$(NVCCFLAGS) --threads 0
ALL_LDFLAGS=$(ALL_CCFLAGS)
GENCODE_FLAGS=-gencode arch=compute_35,code=compute_35
INCLUDES=-I$(IDIR) -I/usr/local/cuda/include -I/usr/local/cuda/lib64 -I../lib/cub/ -I../lib/cuda-samples/Common -I../lib/cuda-samples/Common/UtilNPP
LIBS=-lcudart -lcuda -lnppisu_static -lnppif_static -lnppc_static -lculibos -lfreeimage
COMPILER_OPTIONS=--std c++17
COMPILER_FLAGS=$(INCLUDES) $(LIBS) $(COMPILER_OPTIONS)

.PHONY: clean build run

$(TARGET)$(OBJECT_EXTENSION):$(TARGET)$(SOURCE_EXTENSION)
	$(EXEC) $(NVCC) $(INCLUDES) $(ALL_CCFLAGS) $(GENCODE_FLAGS) -o $@ -c $<

build: $(BDIR)/$(TARGET)$(TARGET_EXTENSION)

$(BDIR)/$(TARGET)$(TARGET_EXTENSION):$(TARGET)$(TARGET_EXTENSION)
	$(EXEC) cp $@ $(BDIR)

$(TARGET)$(TARGET_EXTENSION):$(TARGET)$(OBJECT_EXTENSION)
	$(EXEC) $(NVCC) $(ALL_LDFLAGS) $(GENCODE_FLAGS) -o $@ $+ $(LIBRARIES)

clean:
	rm -f $(TARGET)$(TARGET_EXTENSION) $(TARGET)$(OBJECT_EXTENSION)
	rm -f $(BDIR)/$(TARGET)$(TARGET_EXTENSION)

run: build
	$(BDIR)/$(TARGET)$(TARGET_EXTENSION)

all: clean build run