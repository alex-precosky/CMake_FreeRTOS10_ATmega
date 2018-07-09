cmake_minimum_required(VERSION 3.2)

SET(CMAKE_COLOR_MAKEFILE ON)
set(AVR_MCU atmega328p CACHE INTERNAL "")

include(avr_parameters.cmake)
#add_subdirectory(avrfreertos/freeRTOS10xx)
project(demo)
add_subdirectory(freertos)
add_subdirectory(BlinkTest)


