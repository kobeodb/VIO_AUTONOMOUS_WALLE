#include <iostream>

#include "vio/project.hpp"

int main() {
    std::cout << vio::project_name() << '\n';
    std::cout << "default seed: " << vio::default_seed() << '\n';

    return 0;
}
