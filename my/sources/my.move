module my::person {
  use sui::object::UID;
  use sui::tx_context::{Self, TxContext};
  use std::string::{Self, String};

  struct Person has key, drop, store {
    id: UID,
    name: String,
    city: String,
    age: u8,
    date_of_birth: String,
  }

  public fun new_person(name_bytes: vector<u8>, city_bytes: vector<u8>, age: u8, 
                        dob: String, ctx: &mut TxContext) {
    let _person = Person {
      id: object::new(ctx),
      name: string::utf8(name_bytes), 
      city: string::utf8(city_bytes),
      age: age,
      date_of_birth: dob,
    };
  }
}