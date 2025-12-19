3_rust: 2_c
	rustc -Clink-arg=target/1_assembly.o -Clink-arg=target/2_c.o src/3_rust.rs -o target/3_rust --verbose
	# rustc src/3_rust.rs -o target/3_rust --verbose
	# -L target -l 2_c

2_c: 1_assembly
	gcc -Wall -Wpedantic -Werror src/2_c.c -c -fPIC -o target/2_c.o
	# ar rcs target/lib2_c.a target/2_c.o

1_assembly:
	nasm -f elf64 src/1_assembly.S -o target/1_assembly.o

clean:
	rm target/*
