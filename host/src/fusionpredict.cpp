#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <math.h>
#include "CL/opencl.h"
#include "AOCLUtils/aocl_utils.h"
#include "gesture_fusion_weights.h"
using namespace aocl_utils;
using namespace std;

// Entry point.
int fusionpredict() {
// Reading PIC
float *samplefusion = (float *)malloc((22) * sizeof(float)); 
ifstream input1("camres.txt");
for (int i=0; i<11; i++){
	input1 >> samplefusion[i];
}
ifstream input2("accres.txt");
for (int i=11; i<22; i++){
	input2 >> samplefusion[i];
}
// OpenCL runtime configuration
cl_platform_id platform = NULL;
unsigned num_devices = 0;
scoped_array<cl_device_id> device; // num_devices elements
cl_context context = NULL;
cl_command_queue queue;
cl_program program = NULL;

//host buffer
float *h_result_fclassifier2 = (float *)malloc((11) * sizeof(float)); 
float *h_result_flayer1 = (float *)malloc((22) * sizeof(float)); 
char class_label2[201];

cl_kernel fc;

cl_mem d_sample;
cl_mem d_flayer1_weight, d_flayer1_bias, d_result_flayer1;
cl_mem d_flayer2_weight, d_flayer2_bias, d_result_flayer2;
cl_mem d_fclassifier2_weight, d_fclassifier2_bias, d_result_fclassifier2;

  // Initialize OpenCL.
  cl_int status;

  //printf("Initializing OpenCL\n");

  if(!setCwdToExeDir()) {
    return 1;
  }

  // Get the OpenCL platform.
  platform = findPlatform("Intel(R) FPGA");
  if(platform == NULL) {
    printf("ERROR: Unable to find Intel(R) FPGA OpenCL platform.\n");
    return 1;
  }

  // Query the available OpenCL device.
  device.reset(getDevices(platform, CL_DEVICE_TYPE_ALL, &num_devices));
  //printf("Platform: %s\n", getPlatformName(platform).c_str());
  //printf("Using %d device(s)\n", num_devices);
  for(unsigned int i = 0; i < num_devices; ++i) {
    //printf("  %s\n", getDeviceName(device[i]).c_str());
  }

  // Create the context.
  context = clCreateContext(NULL, num_devices, device, NULL, NULL, &status);
  checkError(status, "Failed to create context");

  // Create the program for all device. Use the first device as the
  // representative device (assuming all device are of the same type).
  std::string binary_file = getBoardBinaryFile("gesturenet", device[0]);
  //printf("Using AOCX: %s\n", binary_file.c_str());
  program = createProgramFromBinary(context, binary_file.c_str(), device, num_devices);

  // Build the program that was just created.
  status = clBuildProgram(program, 0, NULL, "", NULL, NULL);
  checkError(status, "Failed to build program");

  queue = clCreateCommandQueue(context, device[0], CL_QUEUE_PROFILING_ENABLE, &status);
  checkError(status, "Failed to create command queue");

  // Kernel.
  const char *kernel1 = "fc";
  fc = clCreateKernel(program, kernel1, &status);
  checkError(status, "Failed to create kernel fc");

	// Layer1
  //Create device buffers
  d_sample = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(float) * (1 * 1 * 2 * 11), samplefusion, &status);
  checkError(status, "Failed to create buffer d_sample");

  //params
  d_flayer1_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(flayer1_weight), flayer1_weight, &status);
  checkError(status, "Failed to create buffer d_flayer1_weight");
  d_flayer1_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(flayer1_bias), flayer1_bias, &status);
  checkError(status, "Failed to create buffer d_flayer1_bias");

  //result
  d_result_flayer1 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 15), NULL, &status);
  checkError(status, "Failed to create buffer d_result_flayer1");

  //Layer 2
  d_flayer2_weight = clCreateBuffer(context,CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR,
                       sizeof(flayer2_weight), flayer2_weight, &status);
  checkError(status, "Failed to create buffer d_flayer2_weight");
  d_flayer2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR,
                       sizeof(flayer2_bias), flayer2_bias, &status);
  checkError(status, "Failed to create buffer d_flayer2_bias");
  d_result_flayer2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 11), NULL, &status);
  checkError(status, "Failed to create buffer d_result_flayer2");

	// Classifier Layer
  d_fclassifier2_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(fclassifier_weight), fclassifier_weight, &status);
  checkError(status, "Failed to create buffer d_fclassifier_weight");
  d_fclassifier2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(fclassifier_bias), fclassifier_bias, &status);
  checkError(status, "Failed to create buffer d_fclassifier_bias");
  d_result_fclassifier2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 11), NULL, &status);
  checkError(status, "Failed to create buffer d_result_fclassifier");
	

  /**************************************************************/
  /*                          Layer1                            */
  /**************************************************************/
  //printf("\r\nFCNet on FPGA start:\r\n");
  //printf("kernel version 1.1\r\n");
  double total = 0.0;
  double start_time = getCurrentTimestamp();

  unsigned int size,relu;
  
  size = 2*11;
  relu = 1;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_sample));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_flayer1_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_flayer1_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_flayer1));
  checkError(status, "Setting flayer1: FC arguments");

  size_t global = 15;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Layer1");

  status = clFinish(queue);
  checkError(status, "Wait for Layer1 finish");

  double end_time = getCurrentTimestamp();
/*   status = clEnqueueReadBuffer(queue, d_sample, CL_TRUE, 0, sizeof(float) * 784, h_result_flayer1, 0, NULL, NULL );

 	printf("Debugging Last Layer\n");
  for(int j = 0; j < 784; j++)
  {
	printf("tmp=%0.3f\r\n", h_result_flayer1[j]);
  }
	printf("End of Debugging Last Layer\n");  */
	
  //printf("\r\nLayer1 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  /**************************************************************/
  /*                         Layer2                             */
  /**************************************************************/
  size = 15;
  relu = 1;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_result_flayer1));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_flayer2_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_flayer2_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_flayer2));
  checkError(status, "Setting flayer2: FC arguments");

  global = 11;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Layer2");


  status = clFinish(queue);
  checkError(status, "Wait for Layer2 finish");
  end_time = getCurrentTimestamp();

	
  //printf("Layer2 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  
  /**************************************************************/
  /*                       fclassifier                           */
  /**************************************************************/
  size = 11;
  relu = 0;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_result_flayer2));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_fclassifier2_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_fclassifier2_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_fclassifier2));
  checkError(status, "Setting Classifier: FC arguments");


  global = 11;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Classifier");

  status = clFinish(queue);
  checkError(status, "Wait for fclassifier finish");
  end_time = getCurrentTimestamp();
  status = clEnqueueReadBuffer(queue, d_result_fclassifier2, CL_TRUE, 0, sizeof(float) * 11, h_result_fclassifier2, 0, NULL, NULL );


  float tmp = 0.0f;
  unsigned int class_index = 0;
  for(int j = 0; j < 11; j++)
  {
    if(h_result_fclassifier2[j] > tmp)
    {
  	  tmp = h_result_fclassifier2[j];
      class_index = j;
    }
  }
  //printf("fclassifier takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  //printf("total: %0.3f ms\r\n", total * 1e3);
  int i;
  FILE *fp;
  fp = fopen("labels.txt", "r");
  for(i = 0; i < class_index + 1; i++)
  {
    fgets(class_label2, sizeof(class_label2), fp);
  }
  fclose(fp);
  printf("\rpredicted label: %s\n", class_label2);
  //printf("done\n");
  
  float *fusionres = (float *)malloc((11) * sizeof(float)); 
  float totalf = 0;
	for (int i=0; i<11; i++){
		totalf += expf(h_result_fclassifier2[i]);
	}
	for (int i=0; i<11; i++){
		fusionres[i] = logf(exp(h_result_fclassifier2[i])/totalf);
	}
  
  ofstream myfile ("fusionres.txt");
  if (myfile.is_open())
  {
    for(int count = 0; count < 11; count ++){
        myfile << fusionres[count] << endl ;
    }
    myfile.close();
  }
  else cout << "Unable to open file";
  

  clReleaseMemObject(d_sample);
  clReleaseMemObject(d_flayer1_weight);
  clReleaseMemObject(d_flayer1_bias);
  clReleaseMemObject(d_result_flayer1);

  clReleaseMemObject(d_flayer2_weight);
  clReleaseMemObject(d_flayer2_bias);
  clReleaseMemObject(d_result_flayer2);

  clReleaseMemObject(d_fclassifier2_weight);
  clReleaseMemObject(d_fclassifier2_bias);
  clReleaseMemObject(d_result_fclassifier2);

  clReleaseKernel(fc);
	
  clReleaseCommandQueue(queue);
  clReleaseCommandQueue(queue);
  clReleaseProgram(program);
  clReleaseContext(context);

  free(h_result_fclassifier2);
  free(h_result_flayer1);
  free(fusionres);
  
  return 0;

}
