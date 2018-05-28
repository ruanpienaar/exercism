#include "acronym.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char *concat(const char *s1, const char *s2){
    char *result = malloc(strlen(s1)+strlen(s2)+1);//+1 for the null-terminator
    //in real code you would check for errors in malloc here
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

char *chartoupper(char *upperstr, char letter){
    unsigned char cu;
    cu = toupper(letter);
    upperstr[0] = cu;
    upperstr[1] = '\0';
    return upperstr;
}

char *abbreviate(const char *phrase){
    if(phrase == NULL || phrase[0] == '\0'){
        return NULL;
    } else {
        int len = strlen(phrase);
        // 1 - take the first letter & uppercase it
        // abbreviation = string that returns as the abbreviation.
        char firstletter[2];
        char * abbreviation = chartoupper(firstletter, phrase[0]);
        // start with 0 since we already took first letter, 
        // wait for space/punctuation to set to 1.
        int take_letter_flag = 0;
        // loop over each letter in phrase
        for(int i = 0; i < len; i++){
            char charletter = phrase[i];
            // when at the first letter, and not a space/punctuation
            if(take_letter_flag && (charletter != ' ' || charletter != '-')){
                // 1 - create String from char letter, and uppercase letter
                char strupperletter[2];
                char *strletter = chartoupper(strupperletter, charletter);
                // 2 - concat letter to Abbreviation string
                abbreviation = concat(abbreviation, strletter);
                take_letter_flag = 0; // unset flag
            }
            // when space/puncuation encoutered
            if(charletter == ' ' || charletter == '-'){
                take_letter_flag = 1;
            }
        }
        return abbreviation;
    }
}
