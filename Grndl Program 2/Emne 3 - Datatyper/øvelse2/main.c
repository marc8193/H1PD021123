#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

typedef struct Node
{
    uint8_t data;
    struct Node* next;
} Node;

static uint8_t* seq_num;
static Node* head;
static Node* prev_node;

void add(Node* node)
{
    *seq_num += 1;
    node->data = *seq_num;

    if (prev_node != 0 && prev_node != node)
    {
        prev_node->next = node;
    }

    prev_node = node;
}

void delete(Node* node)
{
    printf("Deleted node %d in list \n", node->data);

    if (node == head)
    {
        head = head->next;
        free(node);

    } else
    {
        Node* current = head; 
        while(current->next != node)
        {   
            current = current->next;
        }

        current->next = node->next;

        free(node);
    }
}

int main(void)
{
    seq_num = (uint8_t*) malloc(sizeof(uint8_t));
    memset(seq_num, 0x00, sizeof(seq_num));

    prev_node = malloc(sizeof(Node));
    memset(prev_node, 0x00, sizeof(prev_node));

    head = malloc(sizeof(Node));
    add(head);
    
    Node* second = malloc(sizeof(Node));
    add(second);

    Node* third = malloc(sizeof(Node));
    add(third);

    printf("Next node after head is: %d\n", head->next->data);
    
    delete(second);
    
    printf("Next node after head is: %d\n", head->next->data);

    delete(head);
    delete(third);

    free(seq_num);
}