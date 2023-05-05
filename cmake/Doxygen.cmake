find_package(Doxygen REQUIRED OPTIONAL_COMPONENTS dot)
option(USE_DOXYGEN "Turn it OFF if you dont want to create doxygen" ON)
IF(DOXYGEN_FOUND AND USE_DOXYGEN)
    set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "${CMAKE_SOURCE_DIR}/README.md")
    set(DOXYGEN_CALLER_GRAPH YES)
    set(DOXYGEN_CALL_GRAPH YES)
    set(DOXYGEN_EXTRACT_ALL YES)
    set(DOXYGEN_GENERATE_TREEVIEW YES)
    include(FetchContent)
    FetchContent_Declare(_doxygen_theme
            URL https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.1.0.zip)
    FetchContent_MakeAvailable(_doxygen_theme)
    set(DOXYGEN_HTML_EXTRA_STYLESHEET "${_doxygen_theme_SOURCE_DIR}/doxygen-awesome.css")

    doxygen_add_docs(doxygen-docs ALL ${PROJECT_SOURCE_DIR}
            COMMENT "Generating documentation - entry file: ${CMAKE_CURRENT_BINARY_DIR}/html/index.html")
    add_custom_command(TARGET doxygen-docs POST_BUILD
            COMMAND cp -R ${CMAKE_CURRENT_BINARY_DIR}/html ${CMAKE_SOURCE_DIR})
endif()
