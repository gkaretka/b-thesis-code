CFLAGS = -I../libs/inc/*.h
CFLAGS += -I/opt/redpitaya/include
LDFLAGS = -L/opt/redpitaya/lib
LDFLAGS += -static -lrp -lrp-hw -lm 

all:
	gcc main.c ../libs/src/*.c $(CFLAGS) $(LDFLAGS) -o app.o \
	&& ./app.o
