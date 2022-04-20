#include "acronym.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

char *concat(char *s1, const char *letter){
    int size = strlen(s1)+1+1; //+1=letter, +1=null-terminator
    char *result = strncat(s1, letter, size);
    return result;
}

char *chartoupper(char letter){
    unsigned char cu;
    cu = toupper(letter);
    char *u = malloc(2);
    sprintf(u, "%c", cu);
    return u;
}

char *abbreviate(const char *phrase){
    if(phrase == NULL || phrase[0] == '\0'){
        return NULL;
    } else {
        int len = strlen(phrase);
        char *abbreviation = chartoupper(phrase[0]);
        bool take_letter_flag = false; // Already taken first char above
        for(int i = 1; i < len; i++){
            char charletter = phrase[i];
            printf("[%c]", charletter);
            if(take_letter_flag && (charletter != ' ' || charletter != '-' || charletter != '_')){
                char *strletter = chartoupper(charletter);
                abbreviation = concat(abbreviation, strletter);
                take_letter_flag = false; // unset flag
            }
            if(charletter == ' ' || charletter == '-' || charletter == '_'){
                printf("Take Letter\n");
                take_letter_flag = true;
            }
        }
        return abbreviation;
    }
}