use cli_table::{print_stdout, Table, WithTitle};

#[derive(Table)]
pub struct Item {
    #[table(title = "Name")]
    name: String,
    #[table(title = "Price")]
    price: u32,
    #[table(title = "Quantity")]
    quantity: u32,
    #[table(title = "Description")]
    description: String
}

pub struct VendingMachine {
    pub items: Vec<Item>,
}

impl VendingMachine {
    pub fn new() -> Self {
        Self { items: Vec::new() }
    }

    pub fn preview(&self) {
        assert!(print_stdout(self.items.with_title()).is_ok());
    }

    pub fn dispense(&mut self, index: usize) {
        let mut item = &mut self.items[index];

        item.quantity -= 1;
    }   
}

impl Item {
    pub fn new(name: String, price: u32, quantity: u32, description: String) -> Self {
        Self { 
            name, 
            price, 
            quantity, 
            description, 
        }
    }
}