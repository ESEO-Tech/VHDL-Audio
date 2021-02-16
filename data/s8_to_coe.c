
#include <stdio.h>

void main(int argc, char* argv[]) {
    FILE* in = fopen(argv[1], "r");
    FILE* out = fopen(argv[2], "w");

    fprintf(out, "memory_initialization_radix=16;\n");
    fprintf(out, "memory_initialization_vector=\n");

    int first = 1;
    while(!feof(in)) {
        unsigned char c = fgetc(in);
        if (feof(in)) {
            fprintf(out, ";\n");
        }
        else {
            if (!first) {
                fprintf(out, ",\n");
            }
            fprintf(out, "%02x", c);
            first = 0;
        }
    }

    fclose(in);
    fclose(out);
}
