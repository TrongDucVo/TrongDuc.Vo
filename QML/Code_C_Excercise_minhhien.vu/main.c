#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <time.h>

char** str_split(char* a_str, const char a_delim)
{
    char** result    = 0;
    size_t count     = 0;
    char* tmp        = a_str;
    char* last_comma = 0;
    char delim[2];
    delim[0] = a_delim;
    delim[1] = 0;

    /* Count how many elements will be extracted. */
    while (*tmp)
    {
        if (a_delim == *tmp)
        {
            count++;
            last_comma = tmp;
        }
        tmp++;
    }

    /* Add space for trailing token. */
    count += last_comma < (a_str + strlen(a_str) - 1);

    /* Add space for terminating null string so caller
       knows where the list of returned strings ends. */
    count++;

    result = malloc(sizeof(char*) * count);

    if (result)
    {
        size_t idx  = 0;
        char* token = strtok(a_str, delim);

        while (token)
        {
            assert(idx < count);
            *(result + idx++) = strdup(token);
            token = strtok(0, delim);
        }
        assert(idx == count - 1);
        *(result + idx) = 0;
    }

    return result;
}
char* searchkey(int key,int *arrayKey, char* arrayValue)
{

    for(int i = 0;i<sizeof(arrayKey);i++){
        if(key==arrayKey[i]){
            return &arrayValue[i];
        }
    }
    return "don't have";
}
int main()
{
    char c[1000]="12:a,41:d,2:e,5:i,4:10,23:1,1:?,2:d";
    const char* key[1000];
    int keyInt[1000];
    char* value[1000];
    char** strings;
    char** v;


    printf("%s\n\n", c);
    strings = str_split(c,',');

    //    strings1 = str_split(strings,':');
    //    key[1000]=string
    if (strings)
    {
        int i;
        for (i = 0; *(strings + i); i++)
        {
            char *u = *(strings + i);
            v = str_split(u, ':');
            key[i] = *v;
            keyInt[i] = atoi(key[i]);

            //printf ("%d\n",keyInt[i]);
            int j;
            if (v)
            {
                if(keyInt[i]==41)
                {
                    for (j = 0; *(v + j); j++) {
                        *value = *(v+j+1);
                        printf ("Value of Key: %s\n", value[j]);
                    }
                }
            }
        }

        //            char* result;
        //            result = searchkey(2,&keyInt,value);
        //            printf("%s",result);

        //        for(int k=0;k<sizeof(keyInt);k++)
        //        {
        //            if(keyInt==2)
        //            {
        //                printf("%s",*value[k]);
        //            }
        //        }

        free(strings);
        return 0;
    }
}
