target/4_python.py: target/3_rust src/4_python.py
	cp src/4_python.py target/4_python.py

target/3_rust: target/2_c.o src/3_rust.rs
	rustc -Clink-arg=target/1_assembly.o -Clink-arg=target/2_c.o src/3_rust.rs -o target/3_rust

target/2_c.o: target/1_assembly.o src/2_c.c
	gcc -Wall -Wpedantic -Werror src/2_c.c -c -fPIC -o target/2_c.o

target/1_assembly.o: src/1_assembly.S
	nasm -f elf64 src/1_assembly.S -o target/1_assembly.o

.PHONY: clean run
clean:
	rm target/*

run: src/4_python.py
	python target/4_python.py
