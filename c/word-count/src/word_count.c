/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "word_count.h"
#include <stdio.h>

int word_count(const char *input_text, word_count_word_t * words){
    printf("input text %s\n", input_text);
    //printf("word_count_word %s\n", words);
    fprintf("%s %s", words->count, words->text);
    return 0;
}
