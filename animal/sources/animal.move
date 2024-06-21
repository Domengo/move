module animal::animal {
    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::string;

    public struct AnimalObject has key, store {
        id: UID,
        name: string::String,
        no_of_legs: u64,
        favorite_food: string::String,
    }

    public entry fun create_animal_object(
        name: vector<u8>,
        no_of_legs: u64,
        favorite_food: vector<u8>,
        ctx: &mut TxContext,
    ){
        let animal_object = AnimalObject {
            id: object::new(ctx),
            name: string::utf8(name),
            no_of_legs: no_of_legs,
            favorite_food: string::utf8(favorite_food),
        };

        transfer::public_transfer(animal_object, tx_context::sender(ctx));
    }
}
