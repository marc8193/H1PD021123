mod machine;

fn main() {
    let mut items: Vec<machine::Item> = Vec::new();

    while items.len() < 10 {
        let item = machine::Item::new("name".to_string(), 100, 10, "description".to_string());

        items.push(item);
    }

    let machine = machine::VendingMachines::new(items);

    machine.preview();

    let i = &mut items[2];

    machine.dispense(i);
}
