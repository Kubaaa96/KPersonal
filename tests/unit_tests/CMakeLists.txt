set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS_DEBUG} -w -O0 -g3 -no-pie")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS_DEBUG} -w -O0 -g3 -no-pie")

if (CMAKE_COMPILER_IS_GNUCXX)
    include(${CMAKE_SOURCE_DIR}/cmake/CodeCoverage.cmake)
    append_coverage_compiler_flags()
endif ()

create_test(ExampleTest
        SOURCES ExampleTest.cpp
        ${CMAKE_SOURCE_DIR}/src/Example.cpp
        )