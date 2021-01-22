
TARGET=main
COMPILE=as
LINK=ld
LIB=-I /lib64/ld-linux-x86-64.so.2

SRC=$(wildcard ./*.s)
OBJ=$(patsubst %.s, %.o, $(SRC))

$(TARGET):$(OBJ)
	$(LINK) -o $@ $^ $(LIB)

$(OBJ):%.o: %.s
	$(COMPILE) -o $@  $^

clean:
	rm -f *.o
	rm -f $(TARGET)
	rm -f *.txt


.PHONY: clean
