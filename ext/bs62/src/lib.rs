extern crate core;

use base_62::base62;
use magnus::{define_class, function, Error, Object};

#[magnus::wrap(class = "Bs62")]
struct Bs62 {}

impl Bs62 {
    pub fn perform_encode(rb_array: Vec<u8>) -> String {
        base62::encode(rb_array.as_slice())
    }
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let c_bs62 = define_class("Bs62", Default::default())?;

    c_bs62.define_singleton_method("perform_encode", function!(Bs62::perform_encode, 1))?;

    Ok(())
}
