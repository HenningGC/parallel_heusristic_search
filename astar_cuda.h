#ifndef ASTAR_CUDA_H
#define ASTAR_CUDA_H

#ifdef __cplusplus
extern "C" {
#endif

void calculateDistances(float *h_x, float *h_y, float goal_x, float goal_y, float *h_distances, int n);

#ifdef __cplusplus
}
#endif

#endif // ASTAR_CUDA_H
