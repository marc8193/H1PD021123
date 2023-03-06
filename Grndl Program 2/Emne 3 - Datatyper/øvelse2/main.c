#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    char* data;
    struct Node* next;
} Node;


int main(void)
{
    Node* first = malloc(sizeof(Node));
    Node* second = malloc(sizeof(Node));

    first->data = "first";
    first->next = second;

    second->data = "second";
    second->next = first;

    printf("Linked list data => %s - %s\n", first->data, first->next->data);

}