#include <iostream>
#include <fstream>
#include <string>

using namespace std;

const string BATTERY_STATUS_FILE = "/sys/class/power_supply/BAT0/status";
const string BATTERY_CAPACITY_FILE = "/sys/class/power_supply/BAT0/capacity";

int main()
{
	// Read battery status
	ifstream status_file(BATTERY_STATUS_FILE);
	string status;
	getline(status_file, status);

	// Read battery capacity
	ifstream capacity_file(BATTERY_CAPACITY_FILE);
	int capacity;
	capacity_file >> capacity;

	// Print battery status and capacity
	//cout << "Battery status: " << status << endl;
	//cout << "Battery percentage: " << capacity << "%" << endl;
	cout << " " << capacity << "% " << status << "" << endl;

	return 0;
}
