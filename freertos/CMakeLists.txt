cmake_minimum_required(VERSION 3.2)

set(AVR_MCU atmega328p)
project(FREERTOS-AVR-DOWNLOAD)

include(ExternalProject)

set(TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake-avr/generic-gcc-avr.cmake)

ExternalProject_Add( freertos_repodownload
  PREFIX "3rd_party"
  GIT_REPOSITORY https://github.com/feilipu/avrfreertos.git
#  GIT_TAG v10.0.0
  CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE} -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
)
message(STATUS ${CMAKE_CURRENT_BINARY_DIR})

add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/CMakeLists.txt
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/avr_parameters.cmake
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/freertos/FreeRTOS.cmake ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/CMakeLists.txt
  COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/avr_parameters.cmake ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/avr_parameters.cmake
  DEPENDS ${CMAKE_SOURCE_DIR}/freertos/FreeRTOS.cmake
  DEPENDS ${CMAKE_SOURCE_DIR}/avr_parameters.cmake
  )

ExternalProject_Add_Step(freertos_repodownload update_build_system 
  COMMENT "Updating build system" 
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/CMakeLists.txt
  DEPENDERS configure 
  ALWAYS OFF 
  ) 


#set(HumbleLogging_LIBRARIES "${CMAKE_SHARED_LIBRARY_PREFIX}humblelogging${CMAKE_SHARED_LIBRARY_SUFFIX}")
set(FreeRTOS_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload/freeRTOS10xx/include CACHE INTERNAL "")
set(FreeRTOS_LIB_DIR ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload-build/)
set(FreeRTOS_LIBRARY ${CMAKE_CURRENT_BINARY_DIR}/3rd_party/src/freertos_repodownload-build/libfreertoslib_ext-atmega328p.a CACHE INTERNAL "")

message(STATUS ${FreeRTOS_INCLUDE_DIRS})

