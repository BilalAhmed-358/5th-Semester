#include <stdio.h>
#include <omp.h>

int main(void)
{
    int i;

#pragma omp parallel num_threads(8)
    {
#pragma omp for schedule(static, 1)
        for (int i = 0; i < 8; i++)
            memset(&a[i * 4096], 0, 4096);

#pragma omp for schedule(static, 1)
        for (i = 0; i < 8; i++)
            memset(&a[i * 4096], 1, 4096);
    }

    return 0;
}