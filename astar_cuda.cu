#include <cuda.h>
#include <math.h>
#include "astar_cuda.h"

// CUDA Kernel to calculate Euclidean distance
__global__ void calculateDistancesKernel(float *d_x, float *d_y, float goal_x, float goal_y, float *d_distances, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        float dx = d_x[idx] - goal_x;
        float dy = d_y[idx] - goal_y;
        d_distances[idx] = sqrtf(dx * dx + dy * dy);
    }
}

extern "C" void calculateDistances(float *h_x, float *h_y, float goal_x, float goal_y, float *h_distances, int n) {
    float *d_x, *d_y, *d_distances;
    cudaMalloc(&d_x, n * sizeof(float));
    cudaMalloc(&d_y, n * sizeof(float));
    cudaMalloc(&d_distances, n * sizeof(float));

    cudaMemcpy(d_x, h_x, n * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(d_y, h_y, n * sizeof(float), cudaMemcpyHostToDevice);

    int threadsPerBlock = 256;
    int blocksPerGrid = (n + threadsPerBlock - 1) / threadsPerBlock;

    calculateDistancesKernel<<<blocksPerGrid, threadsPerBlock>>>(d_x, d_y, goal_x, goal_y, d_distances, n);

    cudaMemcpy(h_distances, d_distances, n * sizeof(float), cudaMemcpyDeviceToHost);

    cudaFree(d_x);
    cudaFree(d_y);
    cudaFree(d_distances);
}