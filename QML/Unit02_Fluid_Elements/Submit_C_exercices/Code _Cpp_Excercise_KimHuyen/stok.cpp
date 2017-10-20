#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include <string>
#include<cstring>
using namespace std;

 struct map{
	int key ;
	char value[30] ;
};


int main()
{
	cout<<"\n READ FROM FILE \n\n " ;
	string line ;	
  string str = "";
  ifstream myfile ("input.txt");
  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
    	str+= line ;
      
    }
    myfile.close();
  }

  else cout << "Unable to open file";

  cout<< str ;
	
	
    char *strings[300];
    
    char Policystr[101000] ; 
    
    strcpy(Policystr,str.c_str());
    
    char delims[] = ",";

    int i = 0;
    strings[i] = strtok( Policystr, delims );
    while( strings[i] != NULL  ) 
    {

        strings[++i] = strtok( NULL, delims ); 
        
	       
    }
    
    
    
    // i = 8 
    for ( int j = 0; j < i; j++ ) 
    {
        printf("\n\n %d '%s'\n", j, strings[j]);
    }
    
    map m[i+1] ;
    
     char delim[] = ":";
     
     
     
    for(int j = 0 ; j< i ; j++)
    {
    	char k[3] ;
    	strcpy(k, strtok(strings[j],delim) ) ;
    	m[j].key = atoi(k) ;
    	
    	strcpy(m[j].value , strtok(NULL,delim) ) ;
		
	//	printf("\n %s %s ",m[j].key, m[j].value);	
		
	
	       
    }
    
    
 // sap xep 
 
 for(int j = 0 ; j < i - 1 ; j++)
{
	for(int k = j + 1 ; k < i ; k++)
	{
		if(m[j].key > m[k].key)
		{
			map temp = m[j] ;
			m[j] = m[k] ;
			m[k] = temp ;
		}
	}
 } 
    
 // printf 
 cout<<" \n List sorted : \n ";
 for(int j = 0 ; j< i ; j++) 
 {
 	
 	cout<< "\n " <<m[j].key <<" " << m[j].value ;
   }  
    
    
    // dem
    cout<<" \n\n\n ===========    KQ    ==========\n " ;
    for(int j = 0 ; j < i  ; j++)
    {
    	cout<<"\n"<<m[j].key<<"s print : " ;
    	int b = j ;
    	while(b >= 0)
    	{
    		if(m[j].key % m[b].key == 0)
    		{
    			cout<<" " <<m[b].value ;
			}
			b-- ;
		}
		int c = j+1 ;
		while(c < i ){
			if(m[j].key % m[c].key == 0)
			{
				cout<<" "<<m[c].value ;
			}
			c++ ;
		}
		
    	cout<<"\n";
    	
	}
    
		
system("pause");

return 0 ;
}
    
    
    
    
    
    
    
    

