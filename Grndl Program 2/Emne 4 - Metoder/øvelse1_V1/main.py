#!/usr/bin/env python3

def quickSort(array):
    arrLen = len(array)
    global arrMoves
    arrMoves = 0
    
    # Traverse each element compare with pivot
    for i in range(0, arrLen):
        try:
            j = i
            
            # Comparing i to the element in front
            while (array[j] > array[j + 1]):
                (array[j], array[j + 1]) = (array[j + 1], array[j])
                
                j += 1

                # Tracking used moves
                arrMoves += 1
            
            j = i
            
            # Comparing i to the element behind
            while (array[j] < array[j - 1]):
                (array[j], array[j - 1]) = (array[j - 1], array[j])
                
                j -= 1

                # Tracking used moves
                arrMoves += 1

        except IndexError:
            pass

    return array

def main():
    data = [5, 20, 10, 69, 25, 50, 16]

    print(f"Before: {data}")

    sorted = quickSort(data)

    print(f"After: {sorted}\nUsed moves: {arrMoves}")

if __name__ == "__main__":
    main()
