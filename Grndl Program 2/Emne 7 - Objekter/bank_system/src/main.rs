use inquire::{Text, InquireError, Select};
use std::str::FromStr;

mod account;

fn select_account(accounts: &Vec<account::Account>) -> usize {
    let mut options: Vec<&str> = Vec::new();

    for account in accounts {
        options.push(&account.name);
    }

    let selected = Select::new("Select account from list:", options).prompt().unwrap_or_default();

    let mut selected_account = 0;

    for account in accounts {
        if account.name == selected {
            break;
        } else {
            selected_account += 1;
        }
    }

    selected_account
}

fn main() {
    let mut accounts: Vec<account::Account> = Vec::new();

    loop {
        let options: Vec<&str> = vec!["Create account", "Withdraw/deposit", "Show balance", "Quit"];

        let answer: Result<&str, InquireError> = Select::new("Select action from list:", options).prompt();

        match answer {
            Ok(choice) => match choice {
                "Create account" => {
                    let name = Text::new("Enter name:").prompt().unwrap_or_default();
                    
                    accounts.push(account::Account::new(name));
                }
                "Withdraw/deposit" => {
                    let selected_account = select_account(&accounts);
                    let selected = Text::new("How much would you like to withdraw/deposit?")
                        .prompt()
                        .unwrap_or_default();
                    
                    let value: i32 = FromStr::from_str(&selected).unwrap();

                    accounts[selected_account].edit(value);
                },
                "Show balance" => {
                    for account in &accounts {
                        account.show();
                    }
                },
                _ => break,
            },
            Err(_) => println!("There was an error, please try again"),
        }
    }
}