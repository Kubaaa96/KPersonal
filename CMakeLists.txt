cmake_minimum_required(VERSION 3.16)

set(CONAN_SYSTEM_INCLUDES ON)
include(${CMAKE_SOURCE_DIR}/cmake/CMakeUtils.cmake)

project(KPersonal VERSION 0.0.1 DESCRIPTION "" LANGUAGES CXX)

initialize_conan()

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Gui Widgets REQUIRED)

add_executable(${CMAKE_PROJECT_NAME} ${CMAKE_SOURCE_DIR}/src/main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE         
)
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE ${CONAN_LIBS} Qt6::Core Qt6::Gui Qt6::Widgets)
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE ${CONAN_QT_ROOT}/bin)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE ON
)

if (NOT CMAKE_BUILD_TYPE STREQUAL "Release")
    message("NOT RELEASE mode - enable testing")
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
else ()
    message("RELEASE mode - testing disabled")
endif ()

include(cmake/Doxygen.cmake)