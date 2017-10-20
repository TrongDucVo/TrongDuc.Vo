#include <iostream>
#include <stdio.h>
#include <stdlib.h> 
using namespace std;
struct X{
    char text[10];
};
bool chiaHet(int a, int b){
    if(a % b == 0)
        return 1;
    return 0;
}
int compare (const void * a, const void * b)
{
  return ( *(int*)a - *(int*)b );
} 
int main()
{
    int length = 0;
    X y[20];
    int n = 8;
    int Arr[n] ;
    char A;
    for(int i = 0; i < n; i++){
        cin >> Arr[i];
        cin >> A;
        cin.getline(y[i].text, 10, ',');
    }
    for (int i = 0; i < n; i++){
        if(Arr[i] == 0){
            length = i;
            break;
        }
        cout << Arr[i] << " ";
    }
    cout << endl;
    int chiso[length];
    for(int i = 0; i < length; i++)
        chiso[i] = i;

    qsort (Arr, length, sizeof(int), compare);
    for(int i = 0; i < length; i++){
        if(i > 0 && Arr[i] == Arr[i - 1])
            continue;
        int Count = 1;
        for(int j = 0; j < length; j++){
            if(chiaHet(Arr[i], Arr[j])){
                if(Count == 1)
                    cout << Arr[i] << "s " << "print: " << y[chiso[j]].text << "  ";
                else
                    cout << y[chiso[j]].text << "  ";
                Count++;
            }
        }
        if(Count != 1)
            cout << endl;
    }
    return 0;
}

