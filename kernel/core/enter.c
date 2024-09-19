#include <stdint.h>
#include <stddef.h>
#include "../terminal/terminal.h"

void kernel_start() {
    terminal_initialize();
    terminal_writestring("Hello Kernel\n");
}