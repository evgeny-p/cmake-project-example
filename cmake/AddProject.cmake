include(CompilerFlags)
include(GoogleTest)

function(add_library_project library_name)
  set(options "")
  set(one_value_args "")
  set(multi_value_args SOURCES LIBRARIES)
  cmake_parse_arguments(
    AP
    "${options}"
    "${one_value_args}"
    "${multi_value_args}"
    ${ARGN}
  )

  add_library(${library_name})

  target_include_directories(
    ${library_name}
    PUBLIC
      .
  )

  set_compiler_flags(${library_name})

  target_sources(
    ${library_name}
    PRIVATE
      ${AP_SOURCES}
  )

  target_link_libraries(
    ${library_name}
    PRIVATE
      ${AP_LIBRARIES}
  )
endfunction(add_library_project)

function(add_test_project test_suite_name)
  set(options "")
  set(one_value_args "")
  set(multi_value_args SOURCES LIBRARIES)
  cmake_parse_arguments(
    AP
    "${options}"
    "${one_value_args}"
    "${multi_value_args}"
    ${ARGN}
  )

  set(executable_name ${test_suite_name}_test)
  add_executable(${executable_name})

  set_compiler_flags(${executable_name})

  target_sources(
    ${executable_name}
    PRIVATE
      ${AP_SOURCES}
  )

  target_link_libraries(
    ${executable_name}
    PRIVATE
      ${AP_LIBRARIES}
      gtest
      gtest_main
  )

  gtest_discover_tests(${executable_name})
endfunction(add_test_project)

function(add_executable_project executable_name)
  set(options "")
  set(one_value_args "")
  set(multi_value_args SOURCES LIBRARIES)
  cmake_parse_arguments(
    AP
    "${options}"
    "${one_value_args}"
    "${multi_value_args}"
    ${ARGN}
  )

  add_executable(${executable_name})

  target_include_directories(
    ${executable_name}
    PRIVATE
      .
  )

  set_compiler_flags(${executable_name})

  target_sources(
    ${executable_name}
    PRIVATE
      ${AP_SOURCES}
  )

  target_link_libraries(
    ${executable_name}
    PRIVATE
      ${AP_LIBRARIES}
  )
endfunction(add_executable_project)
