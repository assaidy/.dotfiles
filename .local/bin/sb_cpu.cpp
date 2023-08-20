#include <iostream>
#include <fstream>
#include <ostream>
#include <sstream>
#include <string>
#include <unistd.h>
#include <cmath>

double get_cpu_percentage() {
	double user, nice, system, idle;
	std::ifstream file("/proc/stat");
	std::string line;
	std::getline(file, line);
	std::istringstream iss(line);
	iss.ignore(5);
	iss >> user >> nice >> system >> idle;
	double total_time = user + nice + system + idle;
	double cpu_percentage = (total_time - idle) / total_time * 100.0;
	return cpu_percentage;
}

double get_cpu_temperature() {
	std::ifstream file("/sys/class/thermal/thermal_zone1/temp");
	double temperature;
	file >> temperature;
	file.close();
	return temperature / 1000.0;
}

int main() {
	double cpu_percentage = get_cpu_percentage();
	double cpu_temperature = get_cpu_temperature();
    std::cout << std::round(cpu_percentage) << "%" << std::endl;
	// std::cout << "CPU: " << std::round(cpu_percentage) << "% " << std::round(cpu_temperature) << "C" << std::endl;
	//std::cout << "Temperature: " << std::round(cpu_temperature) << "C" << std::endl;
	return 0;
}
