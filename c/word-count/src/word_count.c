/*Filename : word_count.c
  Author   : ruanpienaar
  Created  : Wed 25 Jul 2018 11:32:27 BST
*/

#include "word_count.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// TODO: check MAX_WORDS against tokcount
// "one fish two fish red fish blue fish"
int word_count(const char *input_text, word_count_word_t * words){
    printf("\ninput_text is \"%s\"\n", input_text);
    int tokcount = 0; // Amount of words found
    // int i = 0; // used for looping over counted words
    // int k = 0; // used for sanitising each character in token string
    // int found = 0; // flag for knowing whether to add word or not
    // int token_length = 0;
    char *token = strtok(strdup(input_text), " ,"); // get first token
    while(token && tokcount <= MAX_WORDS){ // carry on looping while we have words ( tokens )

        int i = 0; // used for looping over counted words
        int k = 0; // used for sanitising each character in token string
        int found = 0; // flag for knowing whether to add word or not
        int token_length = 0;

        printf("token is %s\n", token);

        token_length = strlen(token);
        printf("token_length %i\n", token_length);
        //char *sanitised_token2 = malloc(2);
        char *sanitised_token = malloc(token_length+1);// realloc(sanitised_token2, token_length+1);
        for (k = 0; k < token_length; k++){
            printf("[%d]", tolower(token[k]));
            sanitised_token[k] = tolower(token[k]);
        }
        printf("\n- sanitised_token -> %s -\n", sanitised_token);
        //printf("\n--- token word is --- \"%s\" \n", token);
        if(tokcount == 0){
            words[tokcount].count = 1;
            strcpy(words[tokcount].text, sanitised_token);
            tokcount++;
        } else {
            // How could this be improved? // is there a more efficient way of finding a string in a array?
            found = 0;
            for (i = 0; i < tokcount; i++) {
                int cmp = strncmp(sanitised_token, words[i].text, strlen(sanitised_token));
                //printf("strncmp \"%s\" WITH \"%s\", ANSWER: %i\n", sanitised_token, words[i].text, cmp);
                if( cmp == 0 ){ // if word found
                    found = 1;
                    words[i].count++;
                    break;
                } else { // when word is NOT found
                    //printf("Adding NEW word. was not previously found.");
                    found = 0;
                }
            }
            i = 0;
            if(found == 0 ){
                words[tokcount].count = 1;
                strcpy(words[tokcount].text, sanitised_token);
                tokcount++;
            }
        }
        //free(sanitised_token);
        //free(sanitised_token2);
        token = strtok(NULL, " ,"); // get next token
    }
    printf("=== LOOP summary === \n");
    int j;
    for (j = 0; j < tokcount; j++) {
        printf("[%i] WORD : \"%s\", COUNT : %i\n", j, words[j].text, words[j].count);
    }
    printf("tokcount %i \n", tokcount);
    printf("\n\n\n");
    return tokcount;
}


