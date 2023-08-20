#include <iostream>
#include <ctime>

int main() {
	// Get the current time
	std::time_t now = std::time(nullptr);

	// Convert the time to local time
	std::tm *local_time = std::localtime(&now);

	// Format the time and date string
	char time_str[100];
	std::strftime(time_str, sizeof(time_str), "%I:%M%p", local_time);

	// Print the time and date
	std::cout << time_str << "\n";

	return 0;
}
