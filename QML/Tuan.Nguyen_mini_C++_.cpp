#include <iostream>
#include <fstream.h>
#include <string.h>

using namespace std;
char TempAr[10];
int Ar_cnt=0;
int RightSide[100];
string LeftSide[100];
int cnt=0;
int id[100];

int Sanh(int i,int j)
{
	if(RightSide[i]<RightSide[j]) return -1;
	else return 0;
}
int TrungNhau(int i,int j)
{
    int a=RightSide[id[i]];
    int result;
    for(int k=i+1;k<j;k++)
    {
         if(RightSide[id[k]]!=a)
         {
             result=k-1;
             return result;
         }
    }
    result=i;
         return result;
}
void IdQSort(int d, int c)
{
	int i = d;
	int j = c;
	int m = id[(i + j) / 2];
	int t = 0;
	while (i <= j)
	{
		while (Sanh(id[i], m) < 0) ++i;
		while (Sanh(m, id[j]) < 0) --j;
		if (i <= j)
		{
			t = id[i]; id[i] = id[j]; id[j] = t;
			++i; --j;
		}
	}
	if (d < j) IdQSort(d, j);
	if (i < c) IdQSort(i, c);
}

int main()
{
	char c;
	int state=0;
	
  ifstream myfile ("input.txt");
  if (myfile.is_open())
  {
	  while ( !myfile.eof() )
    {
		myfile.get(c);
		switch(state)
		{
		case 0: //read first number
			if(isdigit(c))
			{
				TempAr[Ar_cnt++]=c;
			}
			else if(c==':')
			{
				state=1;
				RightSide[cnt]=atoi(TempAr);
				memset(TempAr,0,Ar_cnt);
				Ar_cnt=0;
				
			}
			break;
		case 1:
			if(c==',')
			{
				state=0;
				LeftSide[cnt]=TempAr;
				memset(TempAr,0,Ar_cnt);
				Ar_cnt=0;
				cnt++;
			}
			else TempAr[Ar_cnt++]=c;
			break;
		}
    }
		state=0;
		LeftSide[cnt]=TempAr;
		memset(TempAr,0,Ar_cnt);
		Ar_cnt=0;
		cnt++;
		for(int i=0;i<cnt;i++) id[i]=i;
		IdQSort(0,cnt-1);
		ofstream output ("output.txt");
		
		if(output.is_open())
		{
                            
			for(int i=0;i<cnt;i++)
			{
                //if(i<cnt-1) 
                i=TrungNhau(i,cnt);    
				output<<RightSide[id[i]]<<"s print ";
				for(int j=0;j<=i;j++)
				{
					if(RightSide[id[i]]%RightSide[id[j]]==0) 
						output<<LeftSide[id[j]]<<",";
				}
				output<<"\n"; 
			}
		}
		else cout << "Unable to open file\n";
    myfile.close();
  }
  else cout << "Unable to open file\n"; 
	return 0;
	
}
