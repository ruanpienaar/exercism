#include <stdio.h>
#include <string.h>

int is_space(char c){
    if(c == 32){
        return 1;
    } else {
        return 0;
    }
}

int main (int argc, char *argv[]){
    if(argv[1] == NULL){
        printf("NULL\n");
        return 0;
    }
    char *phrase = argv[1];
    int len = strlen(phrase);
    if (len == 0) {
        printf("EMPTY STRING\n");
    } else {
        char abbrev[len];
        int first_letter_taken = 1;
        for (int i = 0; i < len; ++i){
            if( !is_space(phrase[i]) ){
                if( first_letter_taken == 0 ){
                    first_letter_taken = 1;
                    //printf("Take the char\n");
                    //printf("Not Space ! \n" );
                    //abbrev[strlen(abbrev)+1] = phrase[i];
                    char a[2] = phrase[i];
                    strcat(abbrev, a);
                } else {
                    // printf("Dont Take the char\n");
                }
            } else {
                first_letter_taken = 0;
                //printf("Is Space ! \n" );
            }
        }
        printf("%s\n", abbrev);
    }

    // char stringme[100] = "a";
    // strcat(stringme, argv[1]);
    // printf("%s\n", stringme);
    return 0;
}
