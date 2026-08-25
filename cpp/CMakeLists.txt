add_library(vio_core
    src/project.cpp
)

target_include_directories(vio_core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_compile_options(vio_core
    PRIVATE
        -Wall
        -Wextra
        -Wpedantic
)

add_executable(vio_smoke
    apps/vio_smoke.cpp
)

target_link_libraries(vio_smoke
   PRIVATE
    vio_core
)
