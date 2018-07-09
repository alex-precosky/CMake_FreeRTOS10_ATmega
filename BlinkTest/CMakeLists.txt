#cmake_minimum_required(VERSION 3.2)


project(blinktest)


#include_directories(${FreeRTOS_LIB_DIRS})
message(STATUS blinktest FreeRTOS_include_dirs: ${FreeRTOS_INCLUDE_DIRS})
add_avr_executable(
   blinktest
   main.c
)

include_directories(blinktest PUBLIC ${FreeRTOS_INCLUDE_DIRS})

find_library(M_LIB m)
message(STATUS "avr-libm: ${M_LIB}")

find_library(C_LIB c)
message(STATUS "avr-libc: ${C_LIB}")

#find_library(FREERTOS_LIB freertoslib)
message(STATUS "blinktest freertoslib location:x ${FreeRTOS_LIBRARY}")

add_avr_library( freertoslib1 STATIC IMPORTED )
set_target_properties( freertoslib1 PROPERTIES IMPORTED_LOCATION  ${FreeRTOS_LIBRARY} )

avr_target_link_libraries(blinktest freertoslib1 ${C_LIB} ${M_LIB})

