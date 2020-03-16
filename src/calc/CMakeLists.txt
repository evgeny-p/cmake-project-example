project(Calc)

include(AddProject)

set(executable_name calc)

add_executable_project(
  ${executable_name}
  SOURCES
    ${executable_name}/main.cpp
  LIBRARIES
    arithmetic
    cxxopts
)
