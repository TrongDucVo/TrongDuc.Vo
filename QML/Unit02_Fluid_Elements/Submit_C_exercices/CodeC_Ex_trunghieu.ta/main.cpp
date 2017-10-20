#include <iostream>
#include <stdio.h>

using namespace std;

struct X{
    char text[10];
};


bool chiaHet(int a, int b){
    if(a % b == 0)
        return 1;
    return 0;
}

int maxNum(int* A){
    int i = 0;
    int Max = *A;
    while(*(A+i) != 0){
        if(Max < *(A + i))
            Max = *(A + i);
        i++;
    }
    return Max;
}

void BubbleSort(int A[], int N, int chiso[]){
    int i, j;
    for (i = 0; i < N; i++){
        for (j = i + 1; j < N; j++){
            if (A[j] < A[i]){
                int t = chiso[i];
                chiso[i] = chiso[j];
                chiso[j] = t;

                int bub = A[i];
                A[i] = A[j];
                A[j] = bub;
            }
        }
    }
}

int main()
{
    int length = 0;
    X y[20];
    int n = 20;
    int Arr[n];
    char A;
    freopen("input.txt", "r", stdin);

    for(int i = 0; i < n; i++)
        Arr[i] = 0;

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

    BubbleSort(Arr, length, chiso);

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

    cout << "Hello anybody!" << endl;
    return 0;
}

