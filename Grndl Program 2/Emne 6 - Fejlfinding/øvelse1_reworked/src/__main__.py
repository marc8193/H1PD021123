from InquirerPy import prompt
import os

import account

def main():
    os.system('cls' if os.name == 'nt' else 'clear')

    questions = [
        {
            "type": "list",
            "message": "Vælg handling:",
            "choices": ("Opret ny konto", "Hæv/sæt ind", "Se en oversigt", "Afslut"),
            "name": "input",
        },
    ]
    
    input = prompt(questions)
    input = input.get("input")

    if (input == "Opret ny konto"):
        q = [{"type": "input", "message": "Angiv navn på konto ejer:", "name": "input"}]
        
        ac = account.Account(prompt(q).get("input"))

        print(f"Konto oprettet:\nNavn: {ac.name}, Id: {ac.id}")

    elif (input == "Hæv/sæt ind"):
        pass
    elif (input == "Se en oversigt"):
        pass
    elif (input == "Afslut"):
        exit()
    else:
        print("ERROR: Failed to read input!")
        exit()

if __name__ == "__main__":
    main()