#include "adxlpredict.h"
#include "campredict.h"
#include <stdio.h>
#include <stdlib.h>


int main(){
printf("Executing Cam Prediction\n"); 
int stat = campredict();
printf("Executing Adxl362 Prediction\n"); 
stat=adxlpredict();
return stat;
}