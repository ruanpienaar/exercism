#include "isogram.h"
#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Horrible first attempts...

// O(N2)
int is_isogram(const char* str){
    int string_length = strlen(str);
    if(string_length == 0){
        return 1;
    }
    for (int i = 0; i < string_length; ++i){
        char c = tolower(str[i]);
        for (int j = 0; j < string_length; ++j){
            if(j!=i){
                char e = tolower(str[j]);
                if( (isalnum(c) && isalnum(e)) && c == e){
                    return 0;
                }
            }
        }
    }
    return 1;
}
