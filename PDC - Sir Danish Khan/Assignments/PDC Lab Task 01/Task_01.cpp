#include <iostream>
#include <omp.h>

using namespace std;

int main()
{
#pragma omp parallel num_threads(8)
    {
        cout << "This is thread number: " << omp_get_thread_num() << "." << endl;
    }
    return 0;
}