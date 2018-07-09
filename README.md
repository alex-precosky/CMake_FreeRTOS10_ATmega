# About

This project will fetch and build FreeRTOS and an LED blinking demo for an
ATmega328p, but will work with other ATmega chips with basic modification.

# Prerequisites
	* CMake
	* avr-gcc
	* git as CMake uses it to get a dependency

# Building

From the project directory, get the toolchain file:
    $ git clone https://github.com/mkleemann/cmake-avr.git	


Then, we use CMAKE_TOOLCHAIN_FILE since we are cross compiling

	$ cd build
	$ cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE ../cmake-avr/generic-gcc-avr.cmake -DWITH_MCU=OFF ..
	$ make
	$ make
	
The first make will clone the FreeRTOS 10 AVR ATmega, then give an error. The second make will finish
