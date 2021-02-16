
#include <stdio.h>

void main(int argc, char* argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage:\n  ./s8_to_coe SRC DEST\n");
        return;
    }

    FILE* in  = fopen(argv[1], "r");
    FILE* out = fopen(argv[2], "w");

    if (!in) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[1]);
        goto main_end;
    }

    if (!out) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[2]);
        goto main_end;
    }

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

main_end:
    if (in) {
        fclose(in);
    }

    if (out) {
        fclose(out);
    }
}
