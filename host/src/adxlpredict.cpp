#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <bits/stdc++.h>
#include <math.h>
#include "CL/opencl.h"
#include "AOCLUtils/aocl_utils.h"
#include "gesture_acc_weights.h"
#include "testimg.h"
using namespace aocl_utils;
using namespace std;

// Entry point.
int adxlpredict() {
// Reading PIC
float *sampleacc = (float *)malloc((192) * sizeof(float)); 
ifstream input("acc.txt");
for (int i=0; i<192; i++){
	input >> sampleacc[i];
}
// OpenCL runtime configuration
cl_platform_id platform = NULL;
unsigned num_devices = 0;
scoped_array<cl_device_id> device; // num_devices elements
cl_context context = NULL;
cl_command_queue queue;
cl_program program = NULL;

//host buffer
float *h_result_classifier2 = (float *)malloc((11) * sizeof(float)); 
float *h_result_layer1 = (float *)malloc((192) * sizeof(float)); 
char class_label2[201];

cl_kernel fc;

cl_mem d_sample;
cl_mem d_layer1_weight, d_layer1_bias, d_result_layer1;
cl_mem d_layer2_weight, d_layer2_bias, d_result_layer2;
cl_mem d_layer3_weight, d_layer3_bias, d_result_layer3;
cl_mem d_classifier2_weight, d_classifier2_bias, d_result_classifier2;

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
                       sizeof(float) * (1 * 1 * 3 * 64), sampleacc, &status);
  checkError(status, "Failed to create buffer d_sample");

  //params
  d_layer1_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(layer1_weight), layer1_weight, &status);
  checkError(status, "Failed to create buffer d_layer1_weight");
  d_layer1_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(layer1_bias), layer1_bias, &status);
  checkError(status, "Failed to create buffer d_layer1_bias");

  //result
  d_result_layer1 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 30), NULL, &status);
  checkError(status, "Failed to create buffer d_result_layer1");

  //Layer 2
  d_layer2_weight = clCreateBuffer(context,CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR,
                       sizeof(layer2_weight), layer2_weight, &status);
  checkError(status, "Failed to create buffer d_layer2_weight");
  d_layer2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR,
                       sizeof(layer2_bias), layer2_bias, &status);
  checkError(status, "Failed to create buffer d_layer2_bias");
  d_result_layer2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 30), NULL, &status);
  checkError(status, "Failed to create buffer d_result_layer2");

	// Layer3
  d_layer3_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(layer3_weight), layer3_weight, &status);
  checkError(status, "Failed to create buffer d_layer3_weight");
  d_layer3_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(layer3_bias), layer3_bias, &status);
  checkError(status, "Failed to create buffer d_layer3_bias");
  d_result_layer3 = clCreateBuffer(context, CL_MEM_WRITE_ONLY,  
                       sizeof(float) * (1 * 1 * 1 * 11), NULL, &status);
  checkError(status, "Failed to create buffer d_result_layer3");
	// Classifier Layer
  d_classifier2_weight = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(classifier_weight), classifier_weight, &status);
  checkError(status, "Failed to create buffer d_classifier_weight");
  d_classifier2_bias = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
                       sizeof(classifier_bias), classifier_bias, &status);
  checkError(status, "Failed to create buffer d_classifier_bias");
  d_result_classifier2 = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
                       sizeof(float) * (1 * 1 * 1 * 11), NULL, &status);
  checkError(status, "Failed to create buffer d_result_classifier");
	

  /**************************************************************/
  /*                          Layer1                            */
  /**************************************************************/
  //printf("\r\nFCNet on FPGA start:\r\n");
  //printf("kernel version 1.1\r\n");
  double total = 0.0;
  double start_time = getCurrentTimestamp();

  unsigned int size,relu;
  
  size = 3*64;
  relu = 1;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_sample));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_layer1_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_layer1_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_layer1));
  checkError(status, "Setting layer1: FC arguments");

  size_t global = 30;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Layer1");

  status = clFinish(queue);
  checkError(status, "Wait for Layer1 finish");

  double end_time = getCurrentTimestamp();
/*   status = clEnqueueReadBuffer(queue, d_sample, CL_TRUE, 0, sizeof(float) * 784, h_result_layer1, 0, NULL, NULL );

 	printf("Debugging Last Layer\n");
  for(int j = 0; j < 784; j++)
  {
	printf("tmp=%0.3f\r\n", h_result_layer1[j]);
  }
	printf("End of Debugging Last Layer\n");  */
	
  //printf("\r\nLayer1 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  /**************************************************************/
  /*                         Layer2                             */
  /**************************************************************/
  size = 30;
  relu = 1;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_result_layer1));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_layer2_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_layer2_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_layer2));
  checkError(status, "Setting layer2: FC arguments");

  global = 30;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Layer2");


  status = clFinish(queue);
  checkError(status, "Wait for Layer2 finish");
  end_time = getCurrentTimestamp();

	
  //printf("Layer2 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  /**************************************************************/
  /*                         Layer3                             */
  /**************************************************************/
  size = 30;
  relu = 1;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_result_layer2));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_layer3_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_layer3_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_layer3));
  checkError(status, "Setting layer3: FC arguments");

  global = 11;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Layer3");


  status = clFinish(queue);
  checkError(status, "Wait for Layer3 finish");

  end_time = getCurrentTimestamp();

  status = clEnqueueReadBuffer(queue, d_result_layer3, CL_TRUE, 0, sizeof(float) * 10, h_result_layer1, 0, NULL, NULL );
	
  //printf("Layer3 takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
  total += (end_time - start_time);
  start_time = end_time;
  /**************************************************************/
  /*                       classifier                           */
  /**************************************************************/
  size = 11;
  relu = 0;

  status |= clSetKernelArg(fc, 0, sizeof(int), &(size));
  status |= clSetKernelArg(fc, 1, sizeof(int), &(relu));
  status |= clSetKernelArg(fc, 2, sizeof(int), &(d_result_layer3));
  status |= clSetKernelArg(fc, 3, sizeof(int), &(d_classifier2_weight));
  status |= clSetKernelArg(fc, 4, sizeof(int), &(d_classifier2_bias));
  status |= clSetKernelArg(fc, 5, sizeof(int), &(d_result_classifier2));
  checkError(status, "Setting Classifier: FC arguments");


  global = 11;
  status = clEnqueueNDRangeKernel(queue, fc, 1, NULL, &global, NULL, 0, NULL, NULL);
  checkError(status, "Enqueueing Classifier");

  status = clFinish(queue);
  checkError(status, "Wait for classifier finish");
  end_time = getCurrentTimestamp();
  status = clEnqueueReadBuffer(queue, d_result_classifier2, CL_TRUE, 0, sizeof(float) * 11, h_result_classifier2, 0, NULL, NULL );


  float tmp = 0.0f;
  unsigned int class_index = 0;
  for(int j = 0; j < 11; j++)
  {
    if(h_result_classifier2[j] > tmp)
    {
  	  tmp = h_result_classifier2[j];
      class_index = j;
    }
  }
  //printf("classifier takes: %0.3f ms\r\n", (end_time - start_time) * 1e3);
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
  
  float *accres = (float *)malloc((11) * sizeof(float)); 
  float total1 = 0;
	for (int i=0; i<11; i++){
		total1 += expf(h_result_classifier2[i]);
	}
	for (int i=0; i<11; i++){
		accres[i] = logf(exp(h_result_classifier2[i])/total1);
	}
	
  ofstream myfile ("accres.txt");
  if (myfile.is_open())
  {
    for(int count = 0; count < 11; count ++){
        myfile << accres[count] << endl ;
    }
    myfile.close();
  }
  else cout << "Unable to open file";
  

  clReleaseMemObject(d_sample);
  clReleaseMemObject(d_layer1_weight);
  clReleaseMemObject(d_layer1_bias);
  clReleaseMemObject(d_result_layer1);

  clReleaseMemObject(d_layer2_weight);
  clReleaseMemObject(d_layer2_bias);
  clReleaseMemObject(d_result_layer2);

  clReleaseMemObject(d_layer3_weight);
  clReleaseMemObject(d_layer3_bias);
  clReleaseMemObject(d_result_layer3);

  clReleaseMemObject(d_classifier2_weight);
  clReleaseMemObject(d_classifier2_bias);
  clReleaseMemObject(d_result_classifier2);

  clReleaseKernel(fc);
	
  clReleaseCommandQueue(queue);
  clReleaseCommandQueue(queue);
  clReleaseProgram(program);
  clReleaseContext(context);

  free(h_result_classifier2);
  free(h_result_layer1);
  free(accres);
  
  return 0;

}


void cleanup(){
	
}
