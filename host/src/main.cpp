#include "adxlpredict.h"
#include "campredict.h"
#include "fusionpredict.h"
#include <stdio.h>
#include <stdlib.h>


int main(){
printf("Executing Cam Prediction\n"); 
int stat = campredict();
printf("Executing Adxl362 Prediction\n"); 
stat=adxlpredict();
printf("Executing Fusion Prediction\n"); 
stat=fusionpredict();
return stat;
}