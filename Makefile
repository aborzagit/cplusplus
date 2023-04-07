# .KEEP_STATE

test:	test.o
	g++ -O -o test test.o

test.o:	test.cpp
	g++ -O -c test.cpp

clean:
	rm test test.o