#include <stdlib.h>
#include <stdio.h>
#include <string.h>
extern char* _1_assembly_func(void);

char* _2_c_func() {
	char * asm_buf = _1_assembly_func();
	char * buf = malloc(22 + 16); 
	memcpy(buf, asm_buf, 22);
	strcat(buf, "\nHello from C.");

	printf("%s", buf);
	return buf;
}
