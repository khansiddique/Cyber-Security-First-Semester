#include<stdio.h>
#include<string.h>

void GetInput()
{
	char buffer[8];
	printf("Give input for function \"gets() \" testing buffer: ");	
	gets(buffer);
	printf("Function \"gets() \" testing buffer: ");
	puts(buffer);
}


int main (int argc, char** argv)
{
	char buf[500];
	strcpy(buf, argv[1]);
	GetInput();
	printf("Function \"strcpy() \" testing buffer:  %s\n", buf);
	return 0;
}

//Comment:
//---------------------------------------
	/*Flawfinder:ignore*/

	// Flawﬁnder: ignore
//---------------------------------------
