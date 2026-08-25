cmake_minimum_required(VERSION 3.28)

project(
    vio_autonomous_walle
    VERSION 0.1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED on)
set(CMAKE_CXX_EXTENSIONS off)

include(CTest)

add_subdirectory(cpp)

if(BUILD_TESTING)
    add_subdirectory(tests/cpp)
endif()
