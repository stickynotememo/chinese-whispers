#include <stdlib.h>
#include <stdio.h>
#include <string.h>
extern char* _1_assembly_func(void);

char* _2_c_func() {
	char * asm_buf = _1_assembly_func();
	char * buf = malloc(24 + 16); 
	memcpy(buf, asm_buf, 24);
	strcat(buf, "Hello from C.\n");

	return buf;
}
