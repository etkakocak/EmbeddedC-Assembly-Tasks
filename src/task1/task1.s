#include "hardware/regs/addressmap.h"
#include "hardware/regs/sio.h"
#include "hardware/regs/io_bank0.h"
#include "hardware/regs/pads_bank0.h"

.EQU LED_PINA, 0
.EQU LED_PINB, 1
.EQU LED_PINC, 2
.EQU LED_PIND, 3
.EQU LED_PINE, 4
.EQU LED_PINF, 5
.EQU LED_PING, 6
.EQU GPIO_OUT, 1
.EQU sleep_time, 1000

.thumb_func
.global main

main:
@ Initialize pin A
    MOV     R0, #LED_PINA
    BL      gpio_init
    MOV     R0, #LED_PINA
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin B
    MOV     R0, #LED_PINB
    BL      gpio_init
    MOV     R0, #LED_PINB
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin C
    MOV     R0, #LED_PINC
    BL      gpio_init
    MOV     R0, #LED_PINC
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin D
    MOV     R0, #LED_PIND
    BL      gpio_init
    MOV     R0, #LED_PIND
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin E
    MOV     R0, #LED_PINE
    BL      gpio_init
    MOV     R0, #LED_PINE
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin F
    MOV     R0, #LED_PINF
    BL      gpio_init
    MOV     R0, #LED_PINF
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
@ Initialize pin G
    MOV     R0, #LED_PING
    BL      gpio_init
    MOV     R0, #LED_PING
    MOV     R1, #GPIO_OUT
    BL      link_gpio_set_dir
    
loop:

    @0000
    MOV R0, #LED_PING
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @1111
    MOV R0, #LED_PING
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINA
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    

    @2222
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    

    @3333
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @4444
    MOV R0, #LED_PINA
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @5555
    MOV R0, #LED_PINB
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    

    @6666
    MOV R0, #LED_PINB
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    

    @7777
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @8888    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms


    @9999
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    @8888    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @7777
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @6666
    MOV R0, #LED_PINB
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @5555
    MOV R0, #LED_PINB
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @4444
    MOV R0, #LED_PINA
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @3333
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @2222
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINA
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PING
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    @1111
    MOV R0, #LED_PING
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINA
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PIND
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINE
    MOV R1, #0
    BL link_gpio_put
    MOV R0, #LED_PINF
    MOV R1, #0
    BL link_gpio_put
    
    MOV R0, #LED_PINB
    MOV R1, #1
    BL link_gpio_put
    MOV R0, #LED_PINC
    MOV R1, #1
    BL link_gpio_put
    
    LDR R0, =sleep_time
    BL sleep_ms
    
    
    
    B loop
