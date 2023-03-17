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

pub struct VendingMachines {
    items: Vec<Item>,
}

impl VendingMachines {
    pub fn new(items: Vec<Item>) -> Self {
        Self { items }
    }

    pub fn preview(&self) {
        assert!(print_stdout(self.items.with_title()).is_ok());
    }

    pub fn dispense(&self, item: &mut Item) {
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