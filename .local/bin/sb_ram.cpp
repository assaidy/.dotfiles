#include <iostream>
#include <sys/sysinfo.h>

int main() {
    struct sysinfo memInfo;
    sysinfo(&memInfo);

    unsigned long long totalMemory = memInfo.totalram;
    totalMemory *= memInfo.mem_unit;

    unsigned long long freeMemory = memInfo.freeram;
    freeMemory *= memInfo.mem_unit;

    unsigned long long usedMemory = totalMemory - freeMemory; // in bytes

    // double memoryPercentage = (double)usedMemory * 100 / totalMemory;
    double usedMemoryGB = static_cast<double>(usedMemory) / (1024 * 1024 * 1024);

    std::cout << usedMemoryGB << " GB" << std::endl;

    return 0;
}

