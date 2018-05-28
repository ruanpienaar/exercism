#include "acronym.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* concat(const char *s1, const char *s2){
    printf("string 1 %s\n", s1);
    printf("string 2 %s\n", s2);
    char *result = malloc(strlen(s1)+strlen(s2)+1);//+1 for the null-terminator
    //in real code you would check for errors in malloc here
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

char *abbreviate(const char *phrase){
    if(phrase == NULL){
        return NULL;
    } else {
        // init vars
        
        char firstletter[2];
        firstletter[0] = phrase[0];
        firstletter[1] = '\0';
        
        char * abbreviation = firstletter; // string that returns as the abbreviation.
        int take_letter_flag = 0; // start with first letter
        int len = strlen(phrase);
        
        // loop over each letter in phrase
        for(int i = 0; i < len; i++){
            char charletter = phrase[i];
            // when at the first letter, and not a space/punctuation
            if(take_letter_flag && (charletter != ' ' || charletter != '-')){
                
                printf("1. abbreviation is now : %s\n", abbreviation);
                
                // 1 - create String from char letter
                char strletter[100];
                strlcpy(strletter, &charletter, 2);
                printf("strletter is now : %s\n", strletter);
                
                printf("2. abbreviation is now : %s\n", abbreviation);
                
                //printf("strletter : >%s<\n", strletter);
                
                // 2 - uppercase the letter if not already.
                
                // 3 - concat letter to Abbreviation string
                // if empty just set it, don't concat
                //if( strncmp(abbreviation, "", 1) == 0 ){
                    //printf("1) BEFORE abbreviation string : >%s<\n", abbreviation);
                    //abbreviation = strletter;
                    //strlcpy(abbreviation, strletter, 2);
//                    strlcpy(abbreviation, strletter, 8);
                    //strlcpy(abbreviation, strletter, sizeof(abbreviation));
                    //printf("1) AFTER abbreviation string : >%s<\n", abbreviation);
                // if not empty use concat
                //} else { 
                    //printf("2) BEFORE abbreviation string : >%s<\n", abbreviation);
                    //printf("len %lu\n", strlen(abbreviation)+strlen(strletter));
                    //strlcat(abbreviation, strletter, strlen(abbreviation)+strlen(strletter));
                    abbreviation = concat(abbreviation, strletter);
                    //printf("2) AFTER abbreviation string : >%s<\n", abbreviation);
                    //printf("strlcat return %i\n", a);
                //}
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
