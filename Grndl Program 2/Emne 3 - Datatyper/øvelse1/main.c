#include <stdio.h>
#include <stdint.h>
#include <math.h>

void print_var(uint16_t* ptr)
{
    size_t size = pow(2, (sizeof(uint16_t) * 8));
    
    printf("Var Size - %u\n", size);
    printf("Var Address - 0X%X\n", &ptr);
}

int main(void)
{
    uint16_t var = 5;

    print_var(&var);
}