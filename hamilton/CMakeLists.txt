cmake_minimum_required(VERSION 3.16)

project(hamilton VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Svg Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apphamilton
    main.cpp
)

qt_add_qml_module(apphamilton
    URI hamilton
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES resource.qrc
        QML_FILES IconButton.qml
        QML_FILES ColorImage.qml
        QML_FILES TextIconButton.qml
        QML_FILES
        QML_FILES Theme.qml
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apphamilton PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apphamilton
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apphamilton
    PRIVATE Qt6::Quick Qt6::Svg Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS apphamilton
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
