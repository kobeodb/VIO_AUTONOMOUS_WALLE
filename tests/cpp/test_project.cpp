#include "vio/project.hpp"
#include <iostream>

int main() {
    if (vio::project_name() != "VIO Autonomous WALL-E") {
        std::cerr << "Unexpected project name\n";
        return 1;
    }

    if (vio::default_seed() != 42) {
        std::cerr << "unexpected default seed\n";
        return 1;
    }

    std::cout << "test passed";
    return 0;
}
