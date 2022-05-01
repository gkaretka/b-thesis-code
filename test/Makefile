CFLAGS = -I../libs/inc/adf4351_spi_driver.h
CFILES = ../libs/src/adf4351_spi_driver.c
LDFLAGS += -lm 

all:
	gcc compilation_test.c $(CFILES) $(CFLAGS) $(LDFLAGS) -o app.o
