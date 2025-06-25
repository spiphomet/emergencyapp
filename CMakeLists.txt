cmake_minimum_required(VERSION 3.16)

project(HospitalEmergencyApp VERSION 1.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Set Qt version
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

# Add executable
add_executable(HospitalEmergencyApp
    main.cpp
    backend.cpp
    backend.h
    Main.qml
)

# Embed QML into the executable
qt_add_resources(HospitalEmergencyApp "qml"
    PREFIX "/"
    FILES
        Main.qml
)

# Link libraries
target_link_libraries(HospitalEmergencyApp
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::QuickControls2
)
