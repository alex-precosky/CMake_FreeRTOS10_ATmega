cmake_minimum_required(VERSION 3.2)

set(AVR_MCU atmega328p)
project(FREERTOS_AVR)

include(avr_parameters.cmake)

include_directories(freeRTOS10xx/include)

add_avr_library(
  freertoslib_ext STATIC
  freeRTOS10xx/croutine.c
  freeRTOS10xx/event_groups.c
  freeRTOS10xx/hooks.c
  freeRTOS10xx/list.c
  freeRTOS10xx/queue.c
  freeRTOS10xx/stream_buffer.c
  freeRTOS10xx/tasks.c
  freeRTOS10xx/timers.c
  freeRTOS10xx/lib_io/serial.c
  freeRTOS10xx/portable/port.c
  freeRTOS10xx/MemMang/heap_4.c
)

message(STATUS "FreeRTOS.cmake")
message(STATUS ${CMAKE_CURRENT_SOURCE_DIR})
avr_target_include_directories(freertoslib_ext PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/freeRTOS10xx/include)
