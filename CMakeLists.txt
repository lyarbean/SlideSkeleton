project(slide)
cmake_minimum_required(VERSION 3.2)

find_package(Qt5 REQUIRED Core Gui Quick Widgets)
set(CMAKE_CXX_FLAGS "-O3 -std=c++1y -pipe -Wall")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_MAKEFILE_VERBOSE ON)

set(SRCS main.cpp)
set(Theme_QRC
theme/theme.qrc
pages/pages.qrc
qml/qml.qrc
python/python.qrc
)
add_executable(slide ${SRCS} ${Theme_QRC})
target_link_libraries(slide Qt5::Core Qt5::Gui Qt5::Quick Qt5::Widgets)

