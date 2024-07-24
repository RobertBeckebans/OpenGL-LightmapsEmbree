cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project("PrecomputedGI")

IF(UNIX)
	set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++14")
	set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
ENDIF()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

if(MSVC)
	add_subdirectory(external/embree)
else()
	list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
	find_package(embree 3.0 REQUIRED)
	find_package(TBB REQUIRED)
endif()

add_subdirectory(external/dwSampleFramework)

set(XATLAS_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/xatlas")
set(EMBREE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/embree/include/embree3")
set(HOSEKSKY_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/HosekSky")
set(THREADPOOL_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/dwThreadPool/include")

include_directories("${DW_SAMPLE_FRAMEWORK_INCLUDES}"
					"${XATLAS_INCLUDE_DIRS}"
					"${EMBREE_INCLUDE_DIRS}"
					"${HOSEKSKY_INCLUDE_DIRS}"
					"${THREADPOOL_INCLUDE_DIRS}")

add_subdirectory(src)