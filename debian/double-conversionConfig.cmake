# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget double-conversion::double-conversion)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target double-conversion::double-conversion
add_library(double-conversion::double-conversion SHARED IMPORTED)

set_target_properties(double-conversion::double-conversion PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "/usr/include/double-conversion"
)

# Import target "double-conversion::double-conversion" for configuration ""
set_property(TARGET double-conversion::double-conversion APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(double-conversion::double-conversion PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/libdouble-conversion.so.3.1"
  IMPORTED_SONAME_NOCONFIG "libdouble-conversion.so.3"
  )

list(APPEND _IMPORT_CHECK_TARGETS double-conversion::double-conversion )
list(APPEND _IMPORT_CHECK_FILES_FOR_double-conversion::double-conversion "${_IMPORT_PREFIX}/libdouble-conversion.so.3.1" )

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

