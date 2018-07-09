#include <avr/io.h>

#include "FreeRTOS.h"
#include "task.h"

static void TaskBlinkLED(void *pvParameters); 

int main(void) __attribute__ ((OS_main));

int main(void)
{
  xTaskCreate(
	      TaskBlinkLED
	      , "LED"
	      , 256	
	      , NULL
	      , 3
	      , NULL );

  vTaskStartScheduler();
}

// blink at a 1 Hz rate 
static void TaskBlinkLED(void *pvParameters)
{
  TickType_t xLastWakeTime;

  xLastWakeTime = xTaskGetTickCount();
    
  // set direction
  DDRC |= _BV(DDD7);  // 1 is output
  
  for(;;)
    {
      PORTD |= _BV(PORTD7);
      
      vTaskDelayUntil( &xLastWakeTime, ( 500 / portTICK_PERIOD_MS ) );
      
      PORTD &= ~_BV(PORTD7);
      
      vTaskDelayUntil( &xLastWakeTime, ( 500 / portTICK_PERIOD_MS ) );     
    }

}
