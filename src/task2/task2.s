.EQU LED_PIN,   0      @ LED pin
.EQU BUTTON_ON,  1     @ Led-on button pin
.EQU BUTTON_OFF, 2     @ Led-off button pin
.EQU GPIO_OUT,   1     @ Output mode for GPIO
.EQU GPIO_IN,    0     @ Input mode for GPIO
.EQU sleep_time, 1000  @ Sleep time in milliseconds

.thumb_func             @ Necessary because SDK uses BLX
.global main            @ Provide program starting address

main:
    @ Initialize pins
    MOV R0, #LED_PIN
    BL gpio_init
    MOV R0, #LED_PIN
    MOV R1, #GPIO_OUT
    BL link_gpio_set_dir

    MOV R0, #BUTTON_ON
    BL gpio_init
    MOV R0, #BUTTON_ON
    MOV R2, #GPIO_IN
    BL link_gpio_set_dir

    MOV R0, #BUTTON_OFF
    BL gpio_init
    MOV R0, #BUTTON_OFF
    MOV R2, #GPIO_IN
    BL link_gpio_set_dir

loop:
    @ Check if the led-on button is pressed
    MOV R0, #BUTTON_ON
    BL link_gpio_get
    CMP R0, #1
    BEQ on_led

    @ Check if the led-off button is pressed
    MOV R0, #BUTTON_OFF
    BL link_gpio_get
    CMP R0, #1
    BEQ off_led

    B loop

on_led:
    @ LED on if led-on button is pressed
    MOV R0, #LED_PIN
    MOV R1, #1
    BL link_gpio_put
    LDR R0, =sleep_time
    BL sleep_ms
    B loop

off_led:
    @ LED off if led-off button is pressed
    MOV R0, #LED_PIN
    MOV R1, #0
    BL link_gpio_put
    LDR R0, =sleep_time
    BL sleep_ms
    B loop
