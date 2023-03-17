use std::vec;

use uuid::Uuid;
use cli_table::{print_stdout, Table, WithTitle};

#[derive(Table)]
pub struct Account {
    #[table(title = "ID")]
    pub id: Uuid,
    #[table(title = "Name")]
    pub name: String,
    #[table(title = "Balance")]
    pub balance: i32,
}

impl Account {
    pub fn new(name: String) -> Self {
        Self {
            id: Uuid::new_v4(),
            name,
            balance: 0,
        }   
    }

    pub fn edit(&mut self, value: i32) {
        self.balance += value;
    }

    pub fn show(&self) {
        let account = vec![
            Self {
                id: self.id,
                name: self.name.clone(),
                balance: self.balance,
            }
        ];

        assert!(print_stdout(account.with_title()).is_ok());
    }
}