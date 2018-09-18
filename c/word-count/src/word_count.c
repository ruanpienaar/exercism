/*Filename : word_count.c
  Author   : ruanpienaar
  Created  : Wed 25 Jul 2018 11:32:27 BST
*/

#include "word_count.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//int main(int argc, char **argv){
//    // TODO: use realloc
//    if(argc >= 1){
//        char *rest_args = malloc(0);
//        for (int i = 1; i < argc; i++) {
//            //printf("arg %d %s\n", i, argv[i]);
//            if( i == 1 ){ // if at first elem, copy
//                (void)realloc(rest_args, strlen(argv[i])+1);
//                strncpy(rest_args, argv[i], strlen(argv[i]) + strlen(rest_args) + 1);
//            } else { // if already set, concat
//                strlcat(rest_args, " ", strlen(rest_args) + 1 + 1);
//                strlcat(rest_args, argv[i], strlen(argv[i]) + strlen(rest_args) + 1);
//            }
//        }
////        printf("rest_args >%s<\n", rest_args);
//        WORD_COUNT_WORD_T words[MAX_WORDS];
//        word_count(rest_args, words);
//    }
//}

int word_count(const char *input_text, WORD_COUNT_WORD_T * words){
    // get first token
    char *token = strtok(strdup(input_text), " ");
    int tokcount = 0; // Amount of tokens found
    while(token){ // TODO: check MAX_WORDS against tokcount
        //printf(">>>>>>>> %s <<<<<<<<<\n", token);
        if(tokcount == 0){
            // array empy
            // ( how could i write this duplication as a function )
            words[tokcount].count = 1;
            //printf("Word >%s< Count %i\n", token, words[tokcount].count);
            strcpy(words[tokcount].text, token);
            tokcount++;
        } else {
            // How could this be improved?
            // is there a more efficient way of finding a string in a array?
            int i;
            for (i = 0; i < tokcount; i++) {
                //printf("strncmp on %s %s Size %lu ...\n", token, words[i].text, strlen(token));
                if( strncmp(token, words[i].text, strlen(token)) == 0 ){ // if word found
                    words[tokcount].count++;
                    printf("Word >%s< Count %i\n", token, words[tokcount].count);
                } else {
                    // if word NOT found
                    // ( how could i write this duplication as a function )
                    words[tokcount].count = 1;
                    strcpy(words[tokcount].text, token);
                    tokcount++;
                }
            }
        }
        // get next token
        token = strtok(NULL, " ");
    }
    //printf("tokcount %i \n", tokcount);
    return tokcount;
}
