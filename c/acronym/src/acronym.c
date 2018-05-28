#include "acronym.h"
#include <stdio.h>
#include <string.h>

char *abbreviate(const char *phrase){
    if(phrase == NULL){
        return NULL;
    } else {
        // init vars
        char * abbreviation = ""; // string that returns as the abbreviation.
        int take_letter_flag = 1; // start with first letter
        int len = strlen(phrase);
        
        // loop over each letter in phrase
        for(int i = 0; i < len; i++){
            char charletter = phrase[i];
            // when at the first letter, and not a space/punctuation
            if(take_letter_flag && (charletter != ' ' || charletter != '-')){
                
                // 1 - create String from char letter
                char strletter[strlen(phrase)];
                strlcpy(strletter, &charletter, 2);
                //printf("strletter : >%s<\n", strletter);
                
                // 2 - uppercase the letter if not already.
                
                // 3 - concat letter to Abbreviation string
                // if empty just set it, don't concat
                printf("size of abbreviation %lu\n", sizeof(abbreviation));
                if( strncmp(abbreviation, "", 1) == 0 ){
                    abbreviation = strletter;
                    //strlcpy(abbreviation, strletter, sizeof(abbreviation));
                    printf("1) abbreviation string : >%s<\n", abbreviation);
                // if not empty use concat
                } else { 
                    printf("2) abbreviation string : >%s<\n", abbreviation);
                    //printf("len %lu\n", strlen(abbreviation)+strlen(strletter));
                    strlcat(abbreviation, strletter, strlen(abbreviation)+strlen(strletter));
                    //printf("strlcat return %i\n", a);
                }
                //printf("abbreviation string : >%s<\n", abbreviation);
                
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
