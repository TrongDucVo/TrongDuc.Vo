#include <stdio.h>
#include <string.h>

int main()
{
//    Varlue init
    FILE *f;
    char ch;
    int i=0,j=0;
    int n=0;
    char st[100] = "";
    char *key[50];
    int k[10];
//    Get text from file
    f = fopen("input.txt","r");
    ch = fgetc(f);
    if (f == NULL)
        {
            printf("Cannot open file \n");
            return 0;
        }
    while (ch!=EOF){
        st[strlen(st)] = ch;
        ch = fgetc(f);
    }
    fclose(f);
    printf("Result after Read File:\n%s",st);
//    count the item of string
    for (i=0;i<strlen(st);i++)
        if (st[i]==':') n++;
//    Get key from string
    i=0;
    char *p = strtok(st,":,");
    while (p!=NULL) {
        key[i++] = p;
        p = strtok(NULL,":,");
    }
    printf("-------------------------------------\n");
    printf("Spit key and value\n");
    printf("key\tvalue\n");
    for (i=0;i<2*n;i++){
        if (i%2==0){
            k[i/2] = atoi(key[i]);
            printf("%s\t",key[i]);
        }else printf("%s\n",key[i]);
    }
//    Found number divisible
    printf("-------------------------------------\n");
    printf("Test Result:\n");
    for (i=0;i<n;i++){
        printf("%d:",k[i]);
        for(j=0;j<n;j++){
            if (k[i]%k[j]==0) printf("%s\t",key[2*j+1]);
        }
        printf("\n");
    }
    getch();
    return 0;
}
