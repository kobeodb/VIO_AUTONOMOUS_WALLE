add_executable(vio_core_test
    test_project.cpp
)

target_link_libraries(vio_core_test
    PRIVATE
        vio_core
)

add_test(
    NAME vio_core_test
    COMMAND vio_core_test
)


