module vis::vis {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};

    // Define a struct to represent a simple object with a name and a value
    struct SimpleObject has key, store {
        id: UID,
        name: String,
        value: u64,
    }

    // Public function to create a new SimpleObject
    public fun create_object(name_bytes: vector<u8>, value: u64, ctx: &mut TxContext): SimpleObject {
        let object = SimpleObject {
            id: object::new(ctx),
            name: string::utf8(name_bytes),
            value,
        };

        transfer::public_transfer(object, tx_context::sender(ctx));
    }
}
