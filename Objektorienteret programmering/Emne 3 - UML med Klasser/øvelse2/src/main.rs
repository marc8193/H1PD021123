mod machine;

fn main() {
    let mut machine = machine::VendingMachine::new();

    while machine.items.len() < 3 {
        let item = machine::Item::new("name".to_string(), 100, 10, "description".to_string());

        machine.items.push(item);
    }

    machine.preview();

    machine.dispense(2);

    machine.preview();
}