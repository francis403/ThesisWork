#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>


unsigned short SIZE=25;


int main(int argc, char** argv) {


   if( argc < 3 ){

      printf("Error!\n");
      printf("\targs should be %s <path-to-plot-file-dir> \n", argv[0]);
      printf("\texample %s . \n", argv[0]);

      exit(0);
   }




	// Path to where the plot_files are
	char *plot_dirs= argv[1];
   // Path to where we should put the results

	// Final file name
	char *final_plot_data_name = "plot_data_main.csv";

	// Counter to the number of files
	unsigned short file_counter = 0;

	// All plot files we have to read
   	FILE** plot_data_files = malloc( sizeof(FILE*) * SIZE );

   	// Resulting file with average of all final_plot_data
   	FILE* final_plot_data  = fopen(final_plot_data_name, "w");

   	struct dirent *dp;
   	DIR *dfd;
   	if( (dfd = opendir(plot_dirs)) == NULL ){
   		fprintf(stderr, "Can't open plot_dirs!\n" );
   	}


   	// get all plot_files
   	while( (dp = readdir(dfd)) != NULL ){

   		char filename[150];

   		if( strstr(dp->d_name, "plot_data_") == NULL || strcmp(final_plot_data_name, dp->d_name) == 0 ) continue;

   		sprintf( filename, "%s/%s", plot_dirs, dp->d_name );

   		*(plot_data_files + file_counter) = fopen(filename, "r");
   		file_counter ++;

   		if(file_counter > SIZE * 0.75){
   			//TODO: increase size
   		}


   	}

   	//Write the  first line
   	
   	int wrote = 0;
   	for( int i = 0; *(plot_data_files + i); i++ ){

 		char line[250];

   		if( *(plot_data_files + i) ){
   			fgets(line, sizeof(line), *(plot_data_files + i));
   			if( !wrote ){
   				fprintf(final_plot_data, "%s", line);
   				wrote = 1;
   			}
   		}

   	}
	
   	//TODO -> pass through all files and start reading

   	short loop_done = 0;

   	while( !loop_done ){

   		// number of line found
   		unsigned short numb = 0;
   		// average per column
   		unsigned long avg[11];

   		for( int i = 0; *(plot_data_files + i) ; i++){

   			char line[250];

   			if( fgets(line, sizeof(line), *(plot_data_files + i)) != NULL ){

   				char* col = strtok(line, ",");
   				short index_col = 0;

   				while( col != NULL ){

   					avg[index_col] += atoi(col);
   				
   					index_col ++;
   					col = strtok(NULL, ",");
   				}

   			}else{
   				loop_done = 1;
   				break;
   			}

   			numb ++;
   		}
   		if( loop_done ) break;
   		if(numb == 0) numb = 1;
   		for(int i = 0; i < 11; i++){
   			if( i != 10 )
   				fprintf(final_plot_data, "%d, ", (avg[i]/numb) );
   			else
   				fprintf(final_plot_data, "%d\n", (avg[i]/numb) );
   			avg[i] = 0;
   		}

   	}
	

   	printf("Average done correctly! Have a good day!\n");


   	//closing all files
   	for(int i = 0; *(plot_data_files + i); i++)
   		fclose(*(plot_data_files + i));

   	if(final_plot_data)	fclose(final_plot_data);
}