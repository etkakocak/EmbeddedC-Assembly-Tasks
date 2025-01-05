#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "blink.pio.h"
#include "hardware/gpio.h"
#include "hardware/irq.h"
#include "hardware/timer.h"
#include "pico/time.h"

const uint led_A = 1;
const uint led_B = 2;
const uint led_C = 3;
const uint led_D = 4;
const uint led_E = 5;
const uint led_F = 6;
const uint led_G = 7;
const uint button_reset = 8;

int counter = 0;

void zero() {
    gpio_init(led_A);
    gpio_set_dir(led_A, GPIO_OUT);
    gpio_init(led_B);
    gpio_set_dir(led_B, GPIO_OUT);
    gpio_init(led_C);
    gpio_set_dir(led_C, GPIO_OUT);
    gpio_init(led_D);
    gpio_set_dir(led_D, GPIO_OUT);
    gpio_init(led_E);
    gpio_set_dir(led_E, GPIO_OUT);
    gpio_init(led_F);
    gpio_set_dir(led_F, GPIO_OUT);
    gpio_init(led_G);
    gpio_set_dir(led_G, GPIO_OUT);
    
    gpio_put(led_A, 1);
    gpio_put(led_B, 1);
    gpio_put(led_C, 1);
    gpio_put(led_D, 1);
    gpio_put(led_E, 1);
    gpio_put(led_F, 1);
    gpio_put(led_G, 0);
}

void one() {
    gpio_put(led_A, 0);
    gpio_put(led_D, 0);
    gpio_put(led_E, 0);
    gpio_put(led_F, 0);
}

void two() {
    gpio_put(led_C, 0);
    gpio_put(led_A, 1);
    gpio_put(led_G, 1);
    gpio_put(led_E, 1);
    gpio_put(led_D, 1);
}

void three() {
    gpio_put(led_E, 0);
    gpio_put(led_C, 1);
}

void four() {
    gpio_put(led_A, 0);
    gpio_put(led_D, 0);
    gpio_put(led_F, 1);
}

void five() {
    gpio_put(led_B, 0);
    gpio_put(led_A, 1);
    gpio_put(led_D, 1);
}

void six() {
    gpio_put(led_E, 1);
}

void seven() {
    gpio_put(led_D, 0);
    gpio_put(led_E, 0);
    gpio_put(led_F, 0);
    gpio_put(led_G, 0);
    gpio_put(led_B, 1);
}

void eight() {
    gpio_put(led_D, 1);
    gpio_put(led_E, 1);
    gpio_put(led_F, 1);
    gpio_put(led_G, 1);
}

void nine() {
    gpio_put(led_E, 0);
}

void update_leds_based_on_counter(int counter) {
    switch (counter) {
        case 0: zero(); break;
        case 1: one(); break;
        case 2: two(); break;
        case 3: three(); break;
        case 4: four(); break;
        case 5: five(); break;
        case 6: six(); break;
        case 7: seven(); break;
        case 8: eight(); break;
        case 9: nine(); break;
    }
}


// Timer callback function
bool repeating_timer_callback(struct repeating_timer *t) {
    // Increment counter and update display
    if (counter < 9) {
        counter++;
    }
    update_leds_based_on_counter(counter);
    return true;
}

// GPIO callback function
void gpio_callback(uint gpio, uint32_t events) {
    if (gpio == button_reset && events & GPIO_IRQ_EDGE_FALL) {
        counter = 0;
        update_leds_based_on_counter(counter);
    }
}

int main() {
    stdio_init_all();

    // Initialisera GPIO-pinnar för 7-segmentsdisplayen
    zero();

    // Initialisera och konfigurera reset-knappen
    gpio_init(button_reset);
    gpio_set_dir(button_reset, GPIO_IN);
    gpio_pull_up(button_reset);
    gpio_set_irq_enabled_with_callback(button_reset, GPIO_IRQ_EDGE_FALL, true, &gpio_callback);

    // Initialisera och starta timer
    struct repeating_timer timer;
    add_repeating_timer_ms(1000, repeating_timer_callback, NULL, &timer);

    while (1) {
        tight_loop_contents();
    }

    return 0;
}
