project(Arithmetic)

include(AddProject)

set(library_name arithmetic)
set(library_dir "lib${library_name}")

add_library_project(
  ${library_name}
  SOURCES
    ${library_dir}/arithmetic.cpp
    ${library_dir}/arithmetic.hpp
)

add_test_project(
  stream_sum
  SOURCES
    test/stream_sum.cpp
  LIBRARIES
    ${library_name}
    test_data_path
)

# Generate file with test path
set(TEST_DATA_DIR ${CMAKE_CURRENT_LIST_DIR}/test/data)

configure_file(
  test/test_data_path.hpp.in
  ${library_dir}/test/test_data_path.hpp
)

add_library(test_data_path INTERFACE)
target_include_directories(
  test_data_path
  INTERFACE
    ${CMAKE_CURRENT_BINARY_DIR}
)
