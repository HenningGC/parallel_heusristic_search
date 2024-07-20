#include <stdio.h>
#include <stdlib.h>
#include "astar_cuda.h"

int main() {
    int n = 1000;
    float *h_x = (float*)malloc(n * sizeof(float));
    float *h_y = (float*)malloc(n * sizeof(float));
    float *h_distances = (float*)malloc(n * sizeof(float));

    for (int i = 0; i < n; ++i) {
        h_x[i] = (float)i;
        h_y[i] = (float)i;
    }

    float goal_x = 500.0f;
    float goal_y = 500.0f;

    calculateDistances(h_x, h_y, goal_x, goal_y, h_distances, n);

    // Output some of the results
    for (int i = 0; i < n; ++i) {
        printf("Distance to node %d: %f\n", i, h_distances[i]);
    }

    free(h_x);
    free(h_y);
    free(h_distances);

    return 0;
}
