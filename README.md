# Embedded C & Assembly Tasks

### Overview
This repository contains a collection of essential ```Embedded C``` and ```Assembly``` programming tasks. These tasks demonstrate fundamental concepts of low-level programming, microcontroller interactions, and real-time embedded system implementations.  

All tasks are developed and tested on ```Raspberry Pi Pico (RP2040)```, utilizing the Raspberry Pi Pico SDK for seamless embedded development. The projects run on Raspberry Pi OS (formerly known as Raspbian), ensuring compatibility with the microcontroller environment.  

Each task includes a detailed explanation and code implementation.  

---

### Task 1: 7-Segment Display Counting with Assembly
**📖 Description**  
This task demonstrates how to control a 7-Segment Display on the **Raspberry Pi Pico (RP2040)** using **ARM Assembly**. The program initializes GPIO pins and cycles through numbers 0 to 9, then counts back down to 0, displaying each digit sequentially.  ¨

**Features:**
- 7-Segment Display Control using GPIO.
- Binary-to-7-segment mapping for numerical representation.
- Sequential Counting (0-9, 9-0) in a loop.

[Click to see the video of the circuit.](images/task1.mp4)



### Task 2: GPIO Abstraction in C and Assembly
**📖 Description**  
This task focuses on creating an abstraction layer for GPIO operations **using both Embedded C and Assembly**. The goal is to provide a higher-level interface for controlling GPIO pins on the Raspberry Pi Pico (RP2040), making low-level register interactions more manageable.

**Features:**
- Encapsulation of GPIO operations (set direction, write, and read).
- Assembly and C interoperability for efficient hardware access.
- Wrapper functions for easier GPIO control in high-level code.
- Optimized low-level hardware access.



### Task 3: C-Programming with Interrupts 
**📖 Description**  
This task is focusing on C programming with interrupts for the Raspberry Pi Pico (RP2040). The goal is to implement an automatic counter on a 7-segment display that updates using a **timer interrupt** and resets when a GPIO interrupt is triggered via a button press.

**Features:**
- 7-Segment Display Counting (0-9, auto-increment).
- Timer Interrupts for periodic updates.
- GPIO Interrupts for button-triggered reset.
- Efficient **Embedded C** Implementation.