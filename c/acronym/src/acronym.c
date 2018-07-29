#include "acronym.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char *abbreviate(const char *phrase){
    if(phrase == NULL || phrase[0] == '\0'){
        return NULL;
    } else {
        int len = strlen(phrase);
        char *abbreviation = chartoupper(phrase[0]);
        int take_letter_flag = 0;
        for(int i = 0; i < len; i++){
            char charletter = phrase[i];
            if(take_letter_flag && (charletter != ' ' || charletter != '-')){
                char *strletter = chartoupper(charletter);
                abbreviation = concat(abbreviation, strletter);
                take_letter_flag = 0; // unset flag
            }
            if(charletter == ' ' || charletter == '-'){
                take_letter_flag = 1;
            }
        }
        return abbreviation;
    }
}

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
