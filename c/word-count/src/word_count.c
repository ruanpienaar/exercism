/*Filename : word_count.c
  Author   : ruanpienaar
  Created  : Tue 11 May 2021 12:59 BST
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "word_count.h"

#define TOKEN_SEPERATOR " ,"

int main(int argc, char *argv[]){
    // for (int i = 0; i < argc; i++){
    //     printf("ARG %d %s\n", i, argv[i]);
    // }
    word_count_word_t * words;
    word_count(argv[1], words);
    return 0;
}

int word_count(const char *input_text, word_count_word_t * words){
    printf("\ninput_text is \"%s\"\n", input_text);
    int word_count = 0;
    char *string=malloc(strlen(input_text));
    strcpy(string, input_text);
    char *token = strtok(string, TOKEN_SEPERATOR);

    int found = 0; // flag for knowing whether to add word or not
    int i = 0; // used for looping over counted words

    while(token && word_count <= MAX_WORDS){
        if( word_count == 0 ) {
            strcpy(words[word_count].text, token);
            words[word_count].count = 1;
            word_count += 1;
        } else {

            for (i = 0; i < word_count; i++) {
                int cmp = strncmp(token, words[i].text, strlen(token));
                if( cmp == 0 ){ // if word found
                    words[i].count++;
                    break;
                }
                if(found == 0){
                    strcpy(words[word_count].text, token);
                    words[word_count].count = 1;
                    word_count += 1;
                }
            }

        }

        found = 0;
        i = 0;
        token = strtok(NULL, TOKEN_SEPERATOR); // get next token
    }
    free(string);
    return word_count;
}